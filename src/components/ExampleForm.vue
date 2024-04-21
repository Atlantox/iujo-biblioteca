<script setup>

</script>

<template>
    <div class="row m-0 p-0">
        <form action="" class="col-12 row m-0 p-2 fs-4 myForm shadowed-l rounded lb-bg-terciary-dark">

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="text">Text input</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <input type="text" class="myInput" id="text" autofocus>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="textarea">Textarea</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <textarea name="" id="textarea" cols="30" rows="4" class="myInput"></textarea>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end">Radio input</label>
                </div>
                <div class="row m-0 p-0 col-6 fs-5 justify-content-center">
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="radio1">Opción 1</label>
                        <input class="col-1" type="radio" id="radio1" name="radio" value="1">
                    </div>
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="radio2">Opción 2</label>
                        <input class="col-1" type="radio" id="radio2" name="radio" value="2">
                    </div>
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="radio3">Opción 3</label>
                        <input class="col-1" type="radio" id="radio3" name="radio" value="3">
                    </div>
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="radio4">Opción 4</label>
                        <input class="col-1" type="radio" id="radio4" name="radio" value="4">
                    </div>
                </div>
            </div>

            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end">Checkbox input</label>
                </div>
                <div class="row m-0 p-0 col-6 fs-5 justify-content-center">
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="checkbox1">Opción 1</label>
                        <input class="col-1" type="checkbox" id="checkbox1" name="checkbox" value="1">
                    </div>
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="checkbox2">Opción 2</label>
                        <input class="col-1" type="checkbox" id="checkbox2" name="checkbox" value="2">
                    </div>
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="checkbox3">Opción 3</label>
                        <input class="col-1" type="checkbox" id="checkbox3" name="checkbox" value="3">
                    </div>
                    <div class="row col-12 col-lg-5 m-0 p-0 my-1">
                        <label class="col-6 text-end" for="checkbox4">Opción 4</label>
                        <input class="col-1" type="checkbox" id="checkbox4" name="checkbox" value="4">
                    </div>
                </div>
            </div>


            <div class="row m-0 p-0 justify-content-center my-2">
                <div class="row m-0 p-0 col-3">
                    <label class="text-end" for="file">File</label>
                </div>
                <div class="row m-0 p-0 col-6">
                    <input name="" id="file" cols="30" rows="4" class="myInput" type="file">
                </div>
            </div>

        
        </form>
    </div>
</template>

<style scoped>

</style>