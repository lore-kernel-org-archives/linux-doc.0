Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584B02E7198
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095377; cv=none; b=TyEUwBrAgTza9vmEfcYf7NGhXPUunSZLjN9sj30TI2L4y2z8Nd8oEJmq80Yki+mCAX4BI2XLJ6gMUE8tRX8pN4WMkkMLLnJpzT0F3rW1gZG+8K/mWzdJXYBJrn3AgeDyek4amRQhDN0wOEOOCEwjfjOxPTbm9rToocDjRKTC0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095377; c=relaxed/simple;
	bh=bKRRvp4lUO8ZcmCBZY0kN70S/55bGVQQtGcWCfrKPNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiEE9v5naVDdqhqJYi2yDMlAIdVlmXYhm4WuHnWMndNzLEvATcC3LJkowCRFCB40e5nEh3jxdlAYq59YFqZE2hIr57f8JM3dFoIKDGU3xThxnlhDU6/8/44RiIyjCWn0rYmPN4aGthT3PhT5VNp1Nvh1AskLyQqYIhGFbFFAqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A4C51570;
	Tue, 25 Nov 2025 10:29:27 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E986C3F6A8;
	Tue, 25 Nov 2025 10:29:33 -0800 (PST)
Date: Tue, 25 Nov 2025 18:29:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, Zenon Xiu <zenonxiu@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
	Zenon Xiu <zenonxiu@outlook.com>
Subject: Re: [PATCH] Documentation/arm64: Fix the typo of register names
Message-ID: <176409536408.296297.11593157526618751437.b4-ty@arm.com>
References: <20251111093539.2760535-1-zenxiu01@a015921.shanghai.arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111093539.2760535-1-zenxiu01@a015921.shanghai.arm.com>

On Tue, 11 Nov 2025 17:35:39 +0800, Zenon Xiu wrote:
> The register name 'HWFGWTR_EL2' and 'HWFGRTR_EL2' is wrong, should be 'HFGWTR_EL2' and 'HFGRTR_EL2'.
> Find the register description on arm website here,
> https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/HFGWTR-EL2--Hypervisor-Fine-Grained-Write-Trap-Register
> https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/HFGRTR-EL2--Hypervisor-Fine-Grained-Read-Trap-Register?lang=en
> 
> 

Applied to arm64 (for-next/documentation), thanks!

[1/1] Documentation/arm64: Fix the typo of register names
      https://git.kernel.org/arm64/c/4b7a59fa700f

-- 
Catalin


-- 
Catalin
