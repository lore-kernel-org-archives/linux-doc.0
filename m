Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9C6C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 12:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbhK2MLg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Nov 2021 07:11:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:58595 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243074AbhK2MJf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Nov 2021 07:09:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="299346248"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="299346248"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 04:06:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="511659335"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost) ([10.252.11.182])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 04:06:11 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Mark Yacoub <markyacoub@chromium.org>, bhawanpreet.lakha@amd.com,
        nicholas.choi@amd.com, linux-doc@vger.kernel.org,
        Michel =?utf-8?Q?D?= =?utf-8?Q?=C3=A4nzer?= 
        <michel@daenzer.net>, roman.li@amd.com,
        amd-gfx@lists.freedesktop.org,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Marek =?utf-8?B?T2w=?= =?utf-8?B?xaHDoWs=?= 
        <marek.olsak@amd.com>, aurabindo.pillai@amd.com,
        Sean Paul <seanpaul@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        qingqing.zhuo@amd.com,
        Christian =?utf-8?Q?K?= =?utf-8?Q?=C3=B6nig?= 
        <christian.koenig@amd.com>, Roman Gilg <subdiff@gmail.com>
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
In-Reply-To: <YaEAVV3Ka2lG/iOh@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <YaEAVV3Ka2lG/iOh@phenom.ffwll.local>
Date:   Mon, 29 Nov 2021 14:06:02 +0200
Message-ID: <87k0grjhed.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
>> Display core documentation is not well organized, and it is hard to find
>> information due to the lack of sections. This commit reorganizes the
>> documentation layout, and it is preparation work for future changes.
>> 
>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> ---
>>  Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>>  .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>>  Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>>  Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>>  Documentation/gpu/drivers.rst                 |  2 +-
>>  5 files changed, 76 insertions(+), 75 deletions(-)
>>  delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>> 
>> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
>> deleted file mode 100644
>> index f7ff7e1309de..000000000000
>> --- a/Documentation/gpu/amdgpu-dc.rst
>> +++ /dev/null
>> @@ -1,74 +0,0 @@
>> -===================================
>> -drm/amd/display - Display Core (DC)
>> -===================================
>> -
>> -*placeholder - general description of supported platforms, what dc is, etc.*
>> -
>> -Because it is partially shared with other operating systems, the Display Core
>> -Driver is divided in two pieces.
>> -
>> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
>> -   hardware programming and resource management are handled here.
>> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
>> -   amdgpu base driver and DRM are implemented here.
>> -
>> -It doesn't help that the entire package is frequently referred to as DC. But
>> -with the context in mind, it should be clear.
>> -
>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
>> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
>> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
>> -
>> -To determine if DC is loaded, search dmesg for the following entry:
>> -
>> -``Display Core initialized with <version number here>``
>> -
>> -AMDgpu Display Manager
>> -======================
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: overview
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> -   :internal:
>> -
>> -Lifecycle
>> ----------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: DM Lifecycle
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :functions: dm_hw_init dm_hw_fini
>> -
>> -Interrupts
>> -----------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>> -   :doc: overview
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>> -   :internal:
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
>> -
>> -Atomic Implementation
>> ----------------------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: atomic
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>> -
>> -Display Core
>> -============
>> -
>> -**WIP**
>> -
>> -FreeSync Video
>> ---------------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: FreeSync Video
>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>> new file mode 100644
>> index 000000000000..bbb8c3fc8eee
>> --- /dev/null
>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>> @@ -0,0 +1,4 @@
>> +Display Core Debug tools
>> +========================
>> +
>> +TODO
>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>> new file mode 100644
>> index 000000000000..3685b3b1ad64
>> --- /dev/null
>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>
> While we bikeshed names, I think it'd would make sense to call this
> overview.rst or intro.rst or similar, since it's meant to contain the
> overall toctree for everything amdgpu related (maybe there will be more in
> the future).

index.rst?


-- 
Jani Nikula, Intel Open Source Graphics Center
