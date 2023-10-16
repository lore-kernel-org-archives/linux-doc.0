Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165616415
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGO3A0zy"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B1CC5
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 00:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697440938; x=1728976938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bCqgcQS98+RSDKqgCw3a4UGnjt3O3DqwS+VuIANuSc=;
  b=hGO3A0zycj/AEp97yuwXGh57f+YoZ27L4mxtBBDe973uufwBbZbZPC9F
   9i2aQnIq+b5x65nsI+aHYPYD3zoOyuCAV8g2MVvAMPUHl66kG0drgtrGn
   WMBAZUIzhhfl1m8nVK4VqucCwLOYxapZiG8V/MwmE15OG/rlLkb50XhvI
   Wv17GS5irW5JwopJwpj2hmuAH5KfsKg6qWXcZN4RMRpArVhIS3O5/L8tE
   WMkYBUGGLJQmxQq4AU+xpuuN0yoavvBUZLQBp82jk44vLD7J9A00JyBfh
   4dRZBHeHINRDjHzRse35/JT3CLUBNRHAHwBaKW/fwTVkGzcqMoErpuXjn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382688255"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="382688255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846300423"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="846300423"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2023 00:22:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsHva-0008BX-0m;
	Mon, 16 Oct 2023 07:22:14 +0000
Date: Mon, 16 Oct 2023 15:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:lkp_test 2/6] dtbs_check:
 Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.yaml:18:11:
 [error] string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202310161508.XIJVQFBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   63ccd3b5226a4629e08c5cdd2bbf6d536134b4d4
commit: c31c5d3ee4c05b5fd8d98e60d20f1e30be1602f7 [2/6] dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt to yaml
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161508.XIJVQFBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161508.XIJVQFBf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +18 Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.yaml

     8	
     9	description: |
    10	    The ZynqMP nvmem provides access to the hardware related data
    11	    like soc revision, IDCODE... etc.
    12	
    13	maintainers:
    14	  - Kalyani <kalyani.akula@amd.com>
    15	  - Praveen <praveen.teja.kundanala@amd.com>
    16	
    17	allOf:
  > 18	  - $ref: "nvmem.yaml#"
    19	
    20	properties:
    21	  compatible:
    22	    const: xlnx,zynqmp-nvmem-fw
    23	
    24	  '#address-cells':
    25	    const: 1
    26	
    27	  '#size-cells':
    28	    const: 1
    29	
    30	required:
    31	  - compatible
    32	
    33	patternProperties:
    34	  "^soc_revision@0$":
    35	    type: object
    36	    description:
    37	      This node is used to read SOC version and IDCODE of ZynqMP. Read-only.
    38	
    39	    properties:
    40	      reg:
    41	        maxItems: 1
    42	
    43	    required:
    44	      - reg
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
