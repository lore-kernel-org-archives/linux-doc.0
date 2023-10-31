Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B610782
	for <linux-doc@vger.kernel.org>; Tue, 31 Oct 2023 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7Ei4bLo"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE16C0
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698733399; x=1730269399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vG9MxGLdn67p53VuEwgq4wcSEex/pfG1BnDjOF+RKoQ=;
  b=a7Ei4bLo7231J9y1aISlM590bSDLRQbyo+GmN8cn3WP435XCYmSUWMXE
   2+Pwi0Nax5VXPRyHitmANZXUA2VVjIUX8x9xPe+ScfatAJODqa8iLWq9H
   k317eW8BZMneFkeRFTXuc4j65jXj/Ga/ZbjsEpDPbbOtkAKhg2NSO7aTe
   sltwCDIc7wsc08e0fpNbpyQz2EU+b5LDPisMh2y/1a2oRNCjF1cmuDTLG
   /MhJtLh3/LnguazQYfg+29iAhlvGPiBsbB2rCLaWfCUYAIVUCLFXGEUSt
   zQrCxq2hBAUNAVt+gjMfUI+MarwhR2ogOy2Mlq5QMNhuPKMDgZewlg1p8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1071598"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1071598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 23:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="826300293"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="826300293"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2023 23:23:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxi9i-000Dsd-2c;
	Tue, 31 Oct 2023 06:23:14 +0000
Date: Tue, 31 Oct 2023 14:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya <quic_c_skakit@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-doc@vger.kernel.org
Subject: [steev:lenovo-x13s-linux-6.6.y 42/92] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202310311437.pKh83Yzs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.6.y
head:   2d02366a5b7fb59aa3ffd350124bdbbd6b15fe69
commit: fb372b18a2690fd444018fe58ddf28dec45f5eae [42/92] dt-bindings: mfd: pm8008: Add regulators for pm8008
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310311437.pKh83Yzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311437.pKh83Yzs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +109 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml

     8	
     9	maintainers:
    10	  - Guru Das Srinagesh <quic_gurus@quicinc.com>
    11	
    12	description: |
    13	  Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
    14	  all the necessary power management, housekeeping, and interface support
    15	  functions into a single IC.
    16	
    17	properties:
    18	  compatible:
    19	    const: qcom,pm8008
    20	
    21	  reg:
    22	    description:
    23	      I2C slave address.
    24	
    25	    maxItems: 1
    26	
    27	  interrupts:
    28	    maxItems: 1
    29	
    30	    description: Parent interrupt.
    31	
    32	  "#interrupt-cells":
    33	    const: 2
    34	
    35	    description: |
    36	      The first cell is the IRQ number, the second cell is the IRQ trigger
    37	      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
    38	
    39	  interrupt-controller: true
    40	
    41	  "#address-cells":
    42	    const: 2
    43	
    44	  "#size-cells":
    45	    const: 0
    46	
    47	  reset-gpios:
    48	    maxItems: 1
    49	
    50	  vdd_l1_l2-supply:
    51	    description: Input supply phandle of ldo1 and ldo2 regulators.
    52	
    53	  vdd_l3_l4-supply:
    54	    description: Input supply phandle of ldo3 and ldo4 regulators.
    55	
    56	  vdd_l5-supply:
    57	    description: Input supply phandle of ldo5 regulator.
    58	
    59	  vdd_l6-supply:
    60	    description: Input supply phandle of ldo6 regulator.
    61	
    62	  vdd_l7-supply:
    63	    description: Input supply phandle of ldo7 regulator.
    64	
    65	patternProperties:
    66	  "^gpio@0,[0-9a-f]+$":
    67	    type: object
    68	
    69	    description: |
    70	      The GPIO peripheral. This node may be specified twice, one for each GPIO.
    71	
    72	    properties:
    73	      compatible:
    74	        items:
    75	          - const: qcom,pm8008-gpio
    76	          - const: qcom,spmi-gpio
    77	
    78	      reg:
    79	        description: Peripheral offset and address of one of the two GPIO peripherals.
    80	        maxItems: 1
    81	
    82	      gpio-controller: true
    83	
    84	      gpio-ranges:
    85	        maxItems: 1
    86	
    87	      interrupt-controller: true
    88	
    89	      "#interrupt-cells":
    90	        const: 2
    91	
    92	      "#gpio-cells":
    93	        const: 2
    94	
    95	    required:
    96	      - compatible
    97	      - reg
    98	      - gpio-controller
    99	      - interrupt-controller
   100	      - "#gpio-cells"
   101	      - gpio-ranges
   102	      - "#interrupt-cells"
   103	
   104	    additionalProperties: false
   105	
   106	  "^ldo[1-7]@[1],[0-9a-f]+$":
   107	    type: object
   108	
 > 109	    $ref: "/schemas/regulator/regulator.yaml#"
   110	
   111	    description: PM8008 regulator peripherals of PM8008 regulator device.
   112	
   113	    properties:
   114	      compatible:
   115	        const: qcom,pm8008-regulator
   116	
   117	      reg:
   118	        description: Peripheral offset and address of the ldo regulator.
   119	        maxItems: 1
   120	
   121	    required:
   122	      - compatible
   123	      - reg
   124	
   125	    unevaluatedProperties: false
   126	
   127	required:
   128	  - compatible
   129	  - reg
   130	  - interrupts
   131	  - "#address-cells"
   132	  - "#size-cells"
   133	  - "#interrupt-cells"
   134	  - reset-gpios
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
