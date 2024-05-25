import React, { useState } from 'react';

interface Arguments {
  force: bool;
}

const InstallationArguments = (
  {
    arguments: Arguments,
  }: {
    arguments: Arguments,
  }
) => {
  const [checked, setChecked] = useState(false);

  const handleCheckboxChange = (event) => {
    setChecked(event.target.checked);
  };

  return (
    <div>
      <label>
        <input
          type="checkbox"
          checked={checked}
          onChange={handleCheckboxChange}
        />
         Check me!
      </label>
    </div>
  );
};

export default InstallationArguments;
