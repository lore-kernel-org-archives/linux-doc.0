Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313C14263
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INQ2L0C/"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D797C2
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698059862; x=1729595862;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=1U99uZizFQq0y6AZOje8KbYsNPhSka//Vk2YyWMQCoY=;
  b=INQ2L0C/WjB735tu/O11c8da+19e3vnwQGloTOKtreYLrPUOasAvpx+k
   6z3wicSksjmHKRk/HP221Wkqcem1+6IWe/NBIstt3hJeirQtqzPLRPbuJ
   Q3UgcjSnB+P7g/+w61sS6tdluhy3vSca2lj5uAD8T3Qukqzc0HigYOfh4
   TF+TxZlVdBxKTsBRsojXlsvEKMCwXR2s1Zhkk4JFy9zVT1MF3o+cvWVLX
   cSueUnMVeIR4e9aGdF+Z/kQj/7H/BW35JV0B+tRVlDSv4Fw3jQpAb6f0S
   u9aj40rY3z/RLCMrzoQFCcfoheEF2G0t/DhPezlRgAFigvGq3qy4/Rndt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="384015846"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="384015846"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="848765565"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="848765565"
Received: from evlad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.180])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:17:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 7/8] Documentation/gpu: Add an explanation about the DC
 weekly patches
In-Reply-To: <20231020220549.493808-8-Rodrigo.Siqueira@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231020220549.493808-1-Rodrigo.Siqueira@amd.com>
 <20231020220549.493808-8-Rodrigo.Siqueira@amd.com>
Date: Mon, 23 Oct 2023 14:17:33 +0300
Message-ID: <87v8axbnaq.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 20 Oct 2023, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:
> Sharing code with other OSes is confusing and raises some questions.
> This patch introduces some explanation about our upstream process with
> the shared code.

Thanks for writing this! It does help with the transparency.

Please find a comment inline.

>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  Documentation/gpu/amdgpu/display/index.rst | 111 ++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
> index b09d1434754d..9d53a42c5339 100644
> --- a/Documentation/gpu/amdgpu/display/index.rst
> +++ b/Documentation/gpu/amdgpu/display/index.rst
> @@ -10,7 +10,114 @@ reason, our Display Core Driver is divided into two pieces:
>  1. **Display Core (DC)** contains the OS-agnostic components. Things like
>     hardware programming and resource management are handled here.
>  2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> -   amdgpu base driver and DRM are implemented here.
> +   amdgpu base driver and DRM are implemented here. For example, you can check
> +   display/amdgpu_dm/ folder.
> +
> +--------------------
> +How AMD shares code?
> +--------------------
> +
> +Maintaining the same code-base across multiple OSes requires a lot of
> +synchronization effort between repositories. In the DC case, we maintain a
> +central repository where everyone who works from other OSes can put their
> +change in this centralized repository. In a simple way, this shared repository
> +is identical to all code that you can see in the display folder. The shared
> +repo has integration tests with our Linux CI farm, and we run an exhaustive set
> +of IGT tests in various AMD GPUs/APUs. Our CI also checks ARM64/32, PPC64/32,
> +and x86_64/32 compilation with DCN enabled and disabled. After all tests pass
> +and the developer gets reviewed by someone else, the change gets merged into
> +the shared repository.
> +
> +To maintain this shared code working properly, we run two activities every
> +week:
> +
> +1. **Weekly backport**: We bring changes from Linux to the other shared
> +   repositories. This work gets massive support from our CI tools, which can
> +   detect new changes and send them to internal maintainers.
> +2. **Weekly promotion**: Every week, we get changes from other teams in the
> +   shared repo that have yet to be made public. For this reason, at the
> +   beginning of each week, a developer will review that internal repo and
> +   prepare a series of patches that can be sent to the public upstream
> +   (promotion).
> +
> +For the context of this documentation, promotion is the essential part that
> +deserves a good elaboration here.
> +
> +Weekly promotion
> +----------------
> +
> +As described in the previous sections, the display folder has its equivalent as
> +an internal repository shared with multiple teams. The promotion activity is
> +the task of 'promoting' those internal changes to the upstream; this is
> +possible thanks to numerous tools that help us manage the code-sharing
> +challenges. The weekly promotion usually takes one week, sliced like this:
> +
> +1. Extract all merged patches from the previous week that can be sent to the
> +   upstream. In other words, we check the week's time frame.
> +2. Evaluate if any potential new patches make sense to the upstream.
> +3. Create a branch candidate with the latest amd-staging-drm-next code together
> +   with the new patches. At this step, we must ensure that every patch compiles
> +   and the entire series pass our set of IGT test in different hardware (i.e.,
> +   it has to pass to our CI).
> +4. Send the new candidate branch for an internal quality test and extra CI
> +   validation.
> +5. Send patches to amd-gfx for reviews. We wait a few days for community
> +   feedback after sending a series to the public mailing list.

So we've debated this one before. :)

Again, I applaud the transparency in writing the document, but I can't
help feeling the weekly promotions are code drops that will generally be
merged unchanged, with no comments. They have all been reviewed
internally, get posted with Reviewed-by tags pre-filled, we have no
visibility to the review. Since the code has already been merged
internally and the batch has passed CI, feels like the bar for changing
anything at this point is pretty high.

Just my two cents.


BR,
Jani.


(Side note, there should be a \n before 6.)

6. If there is
> +   an error, we debug as fast as possible; usually, a simple bisect in the
> +   weekly promotion patches points to a bad change, and we can take two
> +   possible actions: fix the issue or drop the patch. If we cannot identify the
> +   problem in the week interval, we drop the promotion and start over the
> +   following week; in this case, the following promotion will have the previous
> +   patches plus the new ones.
> +
> +We usually rotate the above process with many display developers to keep the
> +workload manageable for everybody. It is good to highlight that the test phase
> +is something that we take extremely seriously, and we never merge anything that
> +fails our validation. Just to give an overview:
> +
> +1. Manual test
> + - Multiple Hotplugs with DP and HDMI.
> + - Stress test with multiple display configuration changes via the user
> +   interface.
> + - Validate VRR behaviour.
> + - Check PSR.
> + - Validate MPO when playing video.
> + - Test more than two displays connected at the same time.
> + - Check suspend/resume.
> +2. Automated test
> + - IGT tests in a farm with GPUs and APUs that support DCN and DCE.
> + - Compilation validation with the latest GCC and Clang from LTS distro.
> + - Cross-compilation for PowerPC 64/32, ARM 64/32, and x86 32.
> +
> +Notice that all of the above tests happen in various AMD devices.
> +
> +Contributions to the weekly promotion
> +-------------------------------------
> +
> +If you have a patch and are unsure if it can cause regressions in other ASICs
> +and want some validation, you can ask us to include your patches in the weekly
> +promotion for validation. Just keep in mind that your patch will be included in
> +the next promotion cycle and re-submitted on your behalf (without changing your
> +authorship) by some of the display developers.
> +
> +The weekly promotion process is a very organic initiative that has changed
> +significantly over the years, thanks to numerous feedbacks. We are all ears if
> +you have any suggestions on how we can improve this process; just keep in mind
> +that this is a very challenging task, and implementing some ideas can take time
> +if possible.
> +
> +DC Workflow for a new feature
> +-----------------------------
> +
> +When we enable a new feature in the DC, the entire development workflow happens
> +on the amd-gfx mailing list. For example, when we enabled the PSR or the Replay
> +feature, all the development happened on amd-gfx. When enabling a new feature,
> +we just use promotion for extra validation in the latest patches by asking the
> +quality team to test the current promotion together with the new patches.
> +
> +--------------
> +DC Information
> +--------------
>  
>  The display pipe is responsible for "scanning out" a rendered frame from the
>  GPU memory (also called VRAM, FrameBuffer, etc.) to a display. In other words,
> @@ -26,8 +133,8 @@ table of content:
>  .. toctree::
>  
>     display-manager.rst
> -   dc-debug.rst
>     dcn-overview.rst
>     dcn-blocks.rst
>     mpo-overview.rst
> +   dc-debug.rst
>     dc-glossary.rst

-- 
Jani Nikula, Intel
