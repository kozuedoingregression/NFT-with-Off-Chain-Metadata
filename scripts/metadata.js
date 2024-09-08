const fs = require("fs");

const CID = "Qma8A21MceBGytEDakLMBsstq6eSF16cgew5r76M4qhp1W";

for(let i=0;i<13;i++)
{
    const filename = `${i}.json`;
    const data ={
        name: `Aria #${(i+1)*248}`,
        description: "threshold between alternate dimensions, where the echoes of divergent paths converge.",
        image: `ipfs://${CID}/${i}.png`
    }

    const jsondata = JSON.stringify(data);

    fs.writeFile(`./metadata/${filename}`, jsondata, (err)=>{
        if(err) throw err;
        console.log(`${filename} has been saved`);
    })
}