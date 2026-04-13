Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12523DEFE1;
	Mon, 13 Apr 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776090711; cv=none; b=Ag/TDw9qu+5QonGeK1MpHstaql+Z6GslfXP/K06q7yvkp/eLuOOt1SQPFurIcVpNWavUrV2W0Ueo2yJweEYiI/pHe/z7r9Y119PT9yHeqOxEfqeRqkrPyBOVA7I5zf4Wa9fGg72ndWkcQ42A+ipwHnuqdXtPZbMPOzUwKNj20oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776090711; c=relaxed/simple;
	bh=Bq30PsvBig46HcczZd+NZdFILcN3Ad0q3W32R7+TqHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTEWaceOBzvaFMMaD6oClAVMoxNnq6gzvKyavpYouaqVAjgOWrhOevFsvdZx3Ta0VfalL3H4fAXpIeZmIrLr0ow2hLFw1J5pAlebksUUCcex2E7L7nFdrwkIyXS7nIvycG34yJSHHwimP12T4/O98HRJxoNkNyuKO9e5Yp7+0XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tcYYyjmN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tcYYyjmN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727F6339;
	Mon, 13 Apr 2026 07:31:37 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B239D3F641;
	Mon, 13 Apr 2026 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776090703; bh=Bq30PsvBig46HcczZd+NZdFILcN3Ad0q3W32R7+TqHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tcYYyjmNQmbBlP/CXf6Tkt6kzenoZ6R7ZWifBjHdYs5iAuiRpjZLOPkfeChoQvwZp
	 KpDX1ZKS4+myLT9ycjsrVWTJoQ3yKZBQ+L/NX3LI1l+6YhXausRfCgrThiN3VtAky4
	 DpGxmw9kcRkClHU9xfGrgpvXZlQpjx5tIKubCWFY=
Message-ID: <c8a48e64-bdef-4d6f-997d-1c912dfcceb7@arm.com>
Date: Mon, 13 Apr 2026 15:31:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <8c4f8019-f6eb-4a3b-a6cf-96e533bfa15f@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8c4f8019-f6eb-4a3b-a6cf-96e533bfa15f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/26 00:56, Fenghua Yu wrote:
> 
> 
> On 3/13/26 07:45, Ben Horgan wrote:
>> This version of the mpam missing pieces series sees a couple of things
>> dropped or hidden. Memory bandwith utilization with free-running counters
>> is dropped in preference of just always using 'mbm_event' mode (ABMC
>> emulation) which simplifies the code and allows for, in the future,
>> filtering by read/write traffic. So, for the interim, there is no memory
>> bandwidth utilization support. CDP is hidden behind config expert as
>> remount of resctrl fs could potentially lead to out of range PARTIDs being
>> used and the fix requires a change in fs/resctrl. The setting of MPAM2_EL2
>> (for pkvm/nvhe) is dropped as too expensive a write for not much value.
>>
>> There are a couple of 'fixes' at the start of the series which address
>> problems in the base driver but are only user visible due to this series.
> 
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks!

Ben

