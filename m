Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA73A368D74;
	Mon, 29 Jun 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734414; cv=none; b=MdbCzp/lQTPzB39/CJQNAz/SdfJCVNs6vl3xpYKhgLND7t7DLWj0P5d3eHf1WH5W2/jHJ7nc940R8Oy/ZVa46C2vwoLbWcbGW+5UHpOFxcqRbeaUvp1NqKEVPZMtws5GZHudj5uy6RiaWEs8XYzkfOnOC6D36crvYYbrGcEYbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734414; c=relaxed/simple;
	bh=p0wFnAZrCB4pBPg2VCLPQTQ9ifQI1HJadWHctmHwp7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYpVxVsVn4bklddgt+ZaCe2lN0d61l9QjBr94LwoesgVD1VW1kiqVr3ya6sqx46/afWq29+feM7C35LXvytCtJvJxs1Z60XcPpSGjR0/twMEVeu1YcArXVfNMIHSaGtd/VkIIPYzhCtUSn3vilGiEz0esc7oAimdSK2+8N2WIwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw1HvND1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw1HvND1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3344B1F000E9;
	Mon, 29 Jun 2026 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782734413;
	bh=oSfJycGBvghvjj9JTE52l96HOp9y/EgWtyndduzLs4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qw1HvND1Q0WFQZiqxOLHcGOKV417i5PFGS2X2jMcUhvRfKooQJ5Uep2OcAIf7jLvB
	 MSdhxcPtPBiE7cRDEGumGyp5U3m77ZWM0WdIU5Qb+gMSFQWbEejK4c3/NIYrFdRc6B
	 9vn1gKHOjdWZ91M/o0SnLa47nD987j3j6M3b1jq3EWqhwgO2NMK0ETG757JlgBli/e
	 oYncoC0i7CwYpdksf2xc2DGEXZN2O4PrI0Kj74QQ4MJvTrBQU2tOIVvWF11PFRv48h
	 XWnRlg3UNVlBDENw5MnN3yVjnRfHI/CPlb0k/xZZ9gz0Eo45tBMDCf8wbJFDGyYCrR
	 8nqpuFH3aFSGQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com,
	mrigendra.chaubey@gmail.com,
	suzuki.poulose@arm.com,
	chenl311@chinatelecom.cn,
	fengchengwen@huawei.com,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	gshan@redhat.com,
	jic23@kernel.org,
	dietmar.eggemann@arm.com,
	sudeep.holla@kernel.org,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 0/2] arm64: acpi: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Mon, 29 Jun 2026 12:59:59 +0100
Message-ID: <178272999871.1010833.778390654407420563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610075202.3597031-1-ruanjinjie@huawei.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 10 Jun 2026 15:52:00 +0800, Jinjie Ruan wrote:
> Fix NULL kobject warning in cpuhp_smt_enable().
> 
> Change in v4:
> - Fix hot-unplug tearing as Sashiko AI code review pointed out
>   by forcing unregistration.
> - Update the arm64 hotplug doc.
> - Update the commit message.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: smp: Fix hot-unplug tearing by forcing unregistration
      https://git.kernel.org/arm64/c/18a4e5cf633f
[2/2] cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()
      https://git.kernel.org/arm64/c/f9a82544c717

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
