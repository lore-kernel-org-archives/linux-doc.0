Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E272E810D9
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 13:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjI0Nvb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 09:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjI0Nvb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 09:51:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0371011D
        for <linux-doc@vger.kernel.org>; Wed, 27 Sep 2023 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822688; x=1727358688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sNVFiQ4kUuge07WbWEjosFNEG06g5v8dLS+aVKSAdN4=;
  b=B0x2FqoqpgvSWWb1FNwGFE9PiWHMziemlxayO0415kvLyLtnXvqvgzdH
   paQl1YMyGS2FbB/CdDkb+KaYG+dOOYtC8AitVCSdTyZHHYu3cCiHiA+BE
   /34oAuJmozD329kMX+GHBIxU0Oi6C5aZZDqd2wkHByC9rNLW0pI4DIHLQ
   MFQku5ZLkPjd7gc932JzXncFWY/iGXVzxV53WVxJT6cMLxVzuv7U3Ryrk
   UtUe1jINg9podLPpAjKVixHzHEyvlS0TrAJpPM8mdOf0VX3WHQkeTUjbC
   WlBfhfH3J1yr+YuwpZHqvAwXHWUFlDwVYR1+PKTs3FEKJ++T33rksccY2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468111425"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="468111425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="698889534"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="698889534"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:51:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:51:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:51:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMR7XlY3pTbB3l083K5uXQG4Zov+9/QPvH2AdnBRa+MSSbkkgoeUtTApOs/FpoFYdyy1l71e4UpBQLLyzUogsAaotKnjemiy1zx8YPB41drzV6b/HUzJaQt2SO3xnalOfkYJDIYIvket2t34eQ0zd2DyJpIwMWrUiwr5LqCenhOGoiV17VfixUOxQd9MBLZ35Pu5Pd7kTUHixN46wb+Nq7k0H0XH64xHqVQs4UWvxHd+vUy38qHa4L7+X2zkDcGmFk3VRiw5wwQRXbke6Lx7gCg/Cs6XDZ6zjgZBHT6b1xcNUlo1dGw6j+l48iPLE/py9JyopK11jDRHeF1jmpdnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIpRx4a4aeBHMDVAi1fVw5/gxZJiDyKmw/5G2Xt9BS4=;
 b=NakkN1aU0FPNx/mz4gCP4Kc0P21+4Fb4m9YLHtpuIMvpGwlQEz+/N7wWx1/QQ9Ge6kz+/6JTgyc3zJGdw6xdPbndB5kM7HnSEi31cKzBcw1dMomIFxasfXFOBUoFpOvE+7dq8eA2lkkUkonUUYrU8xnSpQaOW1fpi2EavuEepuwYNeaUVtwu2o4YjmId4DE0u7RdAs0uxS27nskMOm33LjZ6CviPE4IITH6yabnAX4C0+CzKuOJ2LSbZ9E5bZsYoMB/TPUpqIz5wLRjem+VVKHQCjOmsiiZZR45pTGU+hCAp2JKOSzShR1THLf/R2ifbPXIjrVEDhKiui9il7afEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30; Wed, 27 Sep
 2023 13:51:23 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:51:23 +0000
Date:   Wed, 27 Sep 2023 21:51:13 +0800
From:   kernel test robot <philip.li@intel.com>
To:     Erling Ljunggren <hljunggr@cisco.com>
CC:     <oe-kbuild-all@lists.linux.dev>, Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-doc@vger.kernel.org>
Subject: [hverkuil-media-tree:hdmi-dbg 8/27] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <ZRQzUZQpI09hC5lc@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: c924e8ec-2258-4a8d-b8de-08dbbf60d5d5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6TQSeXJdWfBXyezOv2ksukBw1P+GsxYPLJPIcMMLBPhELUpP8PwKnvrJqx4T7cy7jOw5APtBTbcZzSUrT1X01Ftbif0t73sbyllS1EMve51ktiJFcDL1Sf25Yq2qizZgTQQqvOv4FievmR7SxgEthch2bNri4OAFr5oXBrueWR71SYgjHKoq2c2VU7bfDnFOuDS78XqLE5IPJskNBh0lps/NpIj6N85wRRo6EZua8p/9QxzOb+MmgosEzTB5fiTnK+6oMuD8xpph+WVdm34yrMeTESqJvxMF/EMtsRig47spl0R11F7PyCm/PyeYOPZAw5ybPtFvj4YB/e12gIR0voGoX0JtZqCx0cbi+o0v4zKSNCaR/R3X28I5fTzY89T/3EirzTsX4VGGJdoNyEeaTD5RTHRBF3yh+SotevTThX4DQBLc4kZ/EKjP3xLz4nvzrH4tMLL4dV2ByS0Mj1PMoBEh59XQa+ckmzuwUG4EkWSPI07puKBsqYZZAm5KjPBRbF2w/DwIzW/MnSoZYT5MV2jxq8gji+SUguTJs5tix6yBv2qDEYiIqlf+YEZax1X6LftILKoRzAGQ343ZqI3ZWgjQx64j2scv0FpNYlqepq5Y8KlI5e1K2bEby6NQhUHDfSHRx5P4QAJfMUCQdR+Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(5660300002)(26005)(66556008)(66476007)(316002)(4326008)(6916009)(8936002)(8676002)(66946007)(9686003)(6512007)(41300700001)(6666004)(966005)(86362001)(2906002)(82960400001)(38100700002)(478600001)(6506007)(83380400001)(6486002)(33716001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3HGbT1Ah1hSwuVQkMWTSMZcc4cC1h/tmuBtC78lhI2ri4o6fjvmhPSX8j0PQ?=
 =?us-ascii?Q?yHpL0saLznL9Sqz3bqiiHPr7S1gNLM4rOx0Wv+X+LNBKBXJKOVpC81ntV7Ga?=
 =?us-ascii?Q?finXNxvp3UH00UciMMTcWBT4FJA6BUR+dXDYhvjc9NlRx3QflyH3aRSPV+dv?=
 =?us-ascii?Q?AEYKqOjolY0Nz9a9sR++xN+I1X8OXhRX3CXVs5tcfYx1V3XZhYQY7o+w3YXy?=
 =?us-ascii?Q?npm6DIdppMFdcsyBfYMaUdwAmKn7y+DdPWWsyZZVPo6gQuDdYK3qoLJUx8o2?=
 =?us-ascii?Q?r7jYcU6z3YsyrMSGgv5NH1GpkKKqFo8T0TicrhkDidiiGmFXXnu1qHHFiwJ1?=
 =?us-ascii?Q?j0GjCw9RFF8FvDex58OdfaxdNH8yNr+cN6UrLZm+fsPJIn1gjiODRJ+YqGmU?=
 =?us-ascii?Q?whwlZ9Snc7Bm2SfNVVDuKlVLWDw79MKzXCjS5LhxphsaGVYjxJ4ZyI2RaJGJ?=
 =?us-ascii?Q?z9XPWEmsDncRMsJastk8QbYSiSC2yx1PrYI5X0TycVAjDWINW+R1bAFDdmnD?=
 =?us-ascii?Q?SYrW5e2zc2hvKqT7wQJRleBileOMlonGnSpNECJWLQl6Z31hDEhKyupigCyW?=
 =?us-ascii?Q?TaIqEPrmx0hBWjNltnOfa9C+Pa7CqnK5SKJO0yYNEnsUia7ztkV2/G/VfnUS?=
 =?us-ascii?Q?S5ld88HPURY6ct5WGed9682I86HLsLyfBmNN8eIdGXXUTT0ocWTDQPdkfHWW?=
 =?us-ascii?Q?LMX8uRQ5Vtvh3sy8/Fx7lLBDVGWdxxieIKkxuDZErIPcfsacUz+S33gPdGVf?=
 =?us-ascii?Q?rsTYuIvoClbEDttBEA8Xj1ISVND0hf88UXLCfVvy2j2YIxNGFjTRTu/wQcnr?=
 =?us-ascii?Q?IuS4LIJ7DOQEq+Ej0/PUDM+DqsrI+OjlQorIeeRjomzYA/ZcAZQuaMrscXW5?=
 =?us-ascii?Q?8W+H0hObCpNMbDXCIExF01x15shsAPQlNph8mlkY3VZ7OSwSNVzeiTuaLjrl?=
 =?us-ascii?Q?eJTFz0lrQ3w3EiBNUPDsd+WEbUWEOeGQ+4ycty6gejPZXc/aucdEdI8eYKcJ?=
 =?us-ascii?Q?G9G539IXf7OZ7rR8QzosQ+rCKdP4kKfL0BwWfY2zfYI1FvQZ5nJflpms/cQp?=
 =?us-ascii?Q?gL8egumT23i/yJynQIEkT7KMlR6JkwJNzdOkQC25XoFS3zSKyfEh8m8gNzXn?=
 =?us-ascii?Q?jsr3z9V8lu2IYFHMiM7UeGUDUlrCnh0IAJgpjBiOQJWdz4QUas5rvV/rP3MX?=
 =?us-ascii?Q?XT78KKw2fSLhDGh/+hdL6Jy3QyeK+SH+REpUAvmH8zye8bWAqtUo2Sjuhvus?=
 =?us-ascii?Q?hip9M8Y87Loq7JEFJuiLaX7C3NIMjTG5IvJEo7vrOlXOvALPoFY/VMfaDGuI?=
 =?us-ascii?Q?84AW4uYOmi1K/2OM6aU0ACyyDTxqB7DyW5qb9Y/heoK6Odw5U3CwAZSI5H8G?=
 =?us-ascii?Q?7TRkaWfuhVb7kZXa3ts/E+EXG5BV5fz1WbmCB8ZPebfar8sJY4lwHAdol6pw?=
 =?us-ascii?Q?mCqPyWTNzWPkgduJRHH5EE9DpD+rK9TyYkkx79cQhQa83BMpW2AbXuHwrOa6?=
 =?us-ascii?Q?sF0TtqjEo3/UMi55x9t6YKKoVMY/PGudCmJSGKvQXnnqb7/G9h8hhsmcjsrB?=
 =?us-ascii?Q?FBtjZdluGQyUDEXd+nqReAS6ocKi9lFJhKAVP2Su?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c924e8ec-2258-4a8d-b8de-08dbbf60d5d5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:51:23.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1ADKdw1FBoaNO96rSHQLDUY1QcR+i6Vn5zSoPXszUlqBtUj4rBz1QrZc38YhcM/5quqtfLTV0GLwGjbANe4bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 7a67042f3ea611460e4cf943be4e136b456d8676 [8/27] dt-bindings: media: add cat24c208 bindings
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270131.Luymco2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270131.Luymco2s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml: ignoring, error parsing file

vim +42 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml

3ccffba164ef024 Jenny Manne 2021-07-09  32  
3ccffba164ef024 Jenny Manne 2021-07-09  33  examples:
3ccffba164ef024 Jenny Manne 2021-07-09  34    - |
3ccffba164ef024 Jenny Manne 2021-07-09  35      i2c {
3ccffba164ef024 Jenny Manne 2021-07-09  36          #address-cells = <1>;
3ccffba164ef024 Jenny Manne 2021-07-09  37          #size-cells = <0>;
3ccffba164ef024 Jenny Manne 2021-07-09  38  
3ccffba164ef024 Jenny Manne 2021-07-09  39          adc@17 {
3ccffba164ef024 Jenny Manne 2021-07-09  40              compatible = "ti,ads7128";
3ccffba164ef024 Jenny Manne 2021-07-09  41              reg = <0x17>;
3ccffba164ef024 Jenny Manne 2021-07-09 @42  	    vref-supply = <&vref_5v0_reg>;

:::::: The code at line 42 was first introduced by commit
:::::: 3ccffba164ef0246aff8f810e17c9756c598c170 ti-ads7128: driver for the TI ADS7128 ADC

:::::: TO: Jenny Manne <jenny.v.manne@gmail.com>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

