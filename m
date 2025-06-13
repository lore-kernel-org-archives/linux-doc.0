Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862A1F875A
	for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829931; cv=none; b=cjL3g9XN//KFSmldy4sIY2p+Ms5VP/6fJd8ObXPPxZdz6CWtBIioxvYAZ4eu7e2s2yMEtaFG7ieLIjP3jjm3haRfMT2mDaVs4T1yW1IOHnwB209U+0p/yp7Ocji9JMs1mMBTKwXBiLUZuwU42emfihHJpnYzdUjAfQsy+UmPOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829931; c=relaxed/simple;
	bh=Kev/MH7b3XzfIbzkgR1o2iu55NK3f5nafOrGO/KhEwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BD69z6/VmAgaxZl4agTjkP4JLa2CoW+c7IERJRS5klNMUCrXCJBgRxRg0aaL8qgi9Ibfpthwy99hzqV/38DYYEnNtOHWkT1FR4Vxvw/iN7iip6LSNGKmroNk9Y2r2CeZFVlih0UXUeFQoi1+dHYlYNUmF+0D5ZBJFPUQAFoiMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hZXefQ1z; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hZXefQ1z"
Message-ID: <2ac62524-e45f-4ef6-a8b4-01adfd1391c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749829927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV1sWZeZVf/FIQXque4O5JP0sG577Rz8Lj6jjxTnW8c=;
	b=hZXefQ1zsdCjt1DrWrZaHhu7+CM+Ie5JgTIalZx7nqY2js+eUhbVLFm+cSahtcLnRIBMtM
	6Sz8pXb9SRPlAlw2wYYU4/SHhLiAkOSjhVDfP9VYIdDUZ9PPtKK+y8h7nhiqz3VPpTXXrV
	dwMnBcwhhkVjWndrPKIgkldwS4zTTlA=
Date: Fri, 13 Jun 2025 16:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v6 0/3] dpll: add all inputs phase offset monitor
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, aleksandr.loktionov@intel.com,
 milena.olech@intel.com, corbet@lwn.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org
References: <20250612152835.1703397-1-arkadiusz.kubalewski@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250612152835.1703397-1-arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/06/2025 16:28, Arkadiusz Kubalewski wrote:
> Add dpll device level feature: phase offset monitor.
> 
> Phase offset measurement is typically performed against the current active
> source. However, some DPLL (Digital Phase-Locked Loop) devices may offer
> the capability to monitor phase offsets across all available inputs.
> The attribute and current feature state shall be included in the response
> message of the ``DPLL_CMD_DEVICE_GET`` command for supported DPLL devices.
> In such cases, users can also control the feature using the
> ``DPLL_CMD_DEVICE_SET`` command by setting the ``enum dpll_feature_state``
> values for the attribute.
> Once enabled the phase offset measurements for the input shall be returned
> in the ``DPLL_A_PIN_PHASE_OFFSET`` attribute.
> 
> Implement feature support in ice driver for dpll-enabled devices.
> 
> Verify capability:
> $ ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/dpll.yaml \
>   --dump device-get
> [{'clock-id': 4658613174691613800,
>    'id': 0,
>    'lock-status': 'locked-ho-acq',
>    'mode': 'automatic',
>    'mode-supported': ['automatic'],
>    'module-name': 'ice',
>    'type': 'eec'},
>   {'clock-id': 4658613174691613800,
>    'id': 1,
>    'lock-status': 'locked-ho-acq',
>    'mode': 'automatic',
>    'mode-supported': ['automatic'],
>    'module-name': 'ice',
>    'phase-offset-monitor': 'disable',
>    'type': 'pps'}]
> 
> Enable the feature:
> $ ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/dpll.yaml \
>   --do device-set --json '{"id":1, "phase-offset-monitor":"enable"}'
> 
> Verify feature is enabled:
> $ ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/dpll.yaml \
>   --dump device-get
> [
>   [...]
>   {'capabilities': {'all-inputs-phase-offset-monitor'},
>    'clock-id': 4658613174691613800,
>    'id': 1,
>   [...]
>    'phase-offset-monitor': 'enable',
>   [...]]
> 
> v6:
> - rebase.
> 
> Arkadiusz Kubalewski (3):
>    dpll: add phase-offset-monitor feature to netlink spec
>    dpll: add phase_offset_monitor_get/set callback ops
>    ice: add phase offset monitor for all PPS dpll inputs
> 
>   Documentation/driver-api/dpll.rst             |  18 ++
>   Documentation/netlink/specs/dpll.yaml         |  24 +++
>   drivers/dpll/dpll_netlink.c                   |  69 ++++++-
>   drivers/dpll/dpll_nl.c                        |   5 +-
>   .../net/ethernet/intel/ice/ice_adminq_cmd.h   |  20 ++
>   drivers/net/ethernet/intel/ice/ice_common.c   |  26 +++
>   drivers/net/ethernet/intel/ice/ice_common.h   |   3 +
>   drivers/net/ethernet/intel/ice/ice_dpll.c     | 193 +++++++++++++++++-
>   drivers/net/ethernet/intel/ice/ice_dpll.h     |   8 +
>   drivers/net/ethernet/intel/ice/ice_main.c     |   4 +
>   include/linux/dpll.h                          |   8 +
>   include/uapi/linux/dpll.h                     |  12 ++
>   12 files changed, 384 insertions(+), 6 deletions(-)
> 

Acked-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
