Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E37E83CC1
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541673; cv=none; b=jt/Mklm1Czwf+Vibl1AjOISp0PvIzTt3BL40BVShe3u1eCn1/Dyq9hmrdoID6kgiWvoUlDDLer1XsWxtITIi9vVrkWH5iB40ts/RSI+0G3dCQ8LPvwN3P4QrlwiHmiZnqTRmjIh8xBfW6vuqeQhdxnzdW3fVIdFXZjTT05H3r+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541673; c=relaxed/simple;
	bh=IRdQGU750mBMQZ5P4+Xuc9oCs2EMxc4ckC+Hg1A4K+8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jr1Ys3DuGgPvbg/vEN7jSHqXwBC5JAMDrMiuhY4LVVz7OF9w1iUnAf9QOwj2VWzfozcQBPVv5dxwhx4sgBd0DxKTIIuCv/s38qDvywjJ4o1RLp/gFwWs9ksqP6QmptYcF0dV1vhtAmOjzM8revCZrbgx6BNyQnJmXTWakiHpjcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJV6SS9Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJV6SS9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725541671; x=1757077671;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=IRdQGU750mBMQZ5P4+Xuc9oCs2EMxc4ckC+Hg1A4K+8=;
  b=TJV6SS9ZlvGAsfOiHKZtkSXQrWZYB66DHf+QJhv3xASMzxQol46fTNd0
   rkxJL4hCJtFeZ2TVG6QFWgpvVT5137riFQ3qZZBN/2atrkvm7sFWcNkGi
   U/vCt3JjVbjNAHyi3g9t7t6mp9vDP6tXh41ykO7vVNWIOEY5xG7SVc5ip
   LHnk2C3U2r8AI2/tXuFfv0nUs4U/1OMffJK3NlGUVg++0b2wKHDN+WJKA
   o18062B337y10DPybzKNK0K5TiLVlqgKqFoiizIf3dPe/HNhluqkSj3v5
   33SkCoZUOqVQm4hbOzCpQHykkuUctYZ2q48ShTqTXsyMVQvDuEGLETItS
   A==;
X-CSE-ConnectionGUID: uAoxJ8HQSMWzu2hxyAL8kw==
X-CSE-MsgGUID: /bvZnTugSpep+CkH3QK2zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23811667"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="23811667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 06:07:51 -0700
X-CSE-ConnectionGUID: MFCxwUUdTVyW+TsDyKljjw==
X-CSE-MsgGUID: poxCYpcKRAyMGOqDLCNJsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70034350"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 06:07:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
Date: Thu, 05 Sep 2024 16:07:46 +0300
Message-ID: <87y146p7tp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Sep 2024, "Bernhard M. Wiedemann" <bwiedemann@suse.de> wrote:
> On 05/09/2024 14.04, Jani Nikula wrote:
>> On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
>>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>>>
>>> Because we want reproducible builds
>>> and https://github.com/sphinx-doc/sphinx/issues/6714
>>> did not receive any love from Sphinx devs in five years,
>>> let's disable parallel doc builds until that Sphinx issue is fixed.
>> 
>> You mention in [1] that this is likely a duplicate of [2] i.e. multiple
>> Sphinx instances running in parallel and racing in doctree access.
>> 
>> In kernel, does the issue then boil down to:
>> 
>> htmldocs:
>> 	@$(srctree)/scripts/sphinx-pre-install --version-check
>> 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>> 
>> i.e. multiple Sphinx invocations instead of just one?
>
> If that is the case, then providing a unique doctree dir to each 
> invocation should also help.

I'm not sure that's a good idea, because IIUC there should be one
doctree.

> However my patch for sphinx -j1 did give good test results, too.
> Maybe in your case that would result in 8 sphinx calls with 1 thread 
> each, which would be more appropriate for your machine.

The right thing to do is to have one sphinx-build process and pass -j<N>
to that.

BR,
Jani.

-- 
Jani Nikula, Intel
