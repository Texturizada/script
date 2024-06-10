-- Script para el juego Bola de Hoja con función de auto Perry
-- Requiere el ejecutor Delta

-- Definir las teclas
local Teclas = {
    Izquierda = "a",
    Derecha = "d",
    Saltar = "w"
}

-- Función para encontrar al personaje "Perry"
local function encontrarPerry()
    for i, objeto in ipairs(game:GetService("Workspace"):GetChildren()) do
        if objeto.Name == "Perry" and objeto:IsA("Model") then
            return objeto
        end
    end
    return nil
end

-- Función principal de auto Perry
local function autoPerry()
    local perry = encontrarPerry()
    if perry then
        -- Encuentra la posición de la bola de hoja
        local bolaDeHoja = game:GetService("Workspace").BolaDeHoja
        if bolaDeHoja then
            -- Calcula la distancia entre Perry y la bola de hoja
            local distancia = (perry.Position - bolaDeHoja.Position).magnitude
            
            -- Si la distancia es mayor que un umbral, mueve a Perry hacia la bola de hoja
            if distancia > 10 then
                -- Calcula la dirección hacia la bola de hoja
                local direccion = (bolaDeHoja.Position - perry.Position).unit
                
                -- Mueve a Perry en la dirección calculada
                perry:SetPrimaryPartCFrame(CFrame.new(perry.PrimaryPart.Position + direccion * 5))
            end
        end
    end
end

-- Bucle principal
while true do
    autoPerry()
    wait(0.1) -- Espera un poco para no saturar el sistema
end
