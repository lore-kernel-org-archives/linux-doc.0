Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0BC242D6A
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768550830; cv=none; b=IzNOHwbI6EAwkdRCXe6hgLmiBmPQI84aihk7DephaGEdN76AkiX4brudcTqcicaH2aibh/psIfHCCwjMqm6rK0HtVDr4M2xgr+jLkE4SVCmJsNT/Vzc9ttxg6oBbBGWqd7a1rUUJ617kMVRi4B6zljziLWZcDuph3hulxLtjyxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768550830; c=relaxed/simple;
	bh=4/hROgGKG17UFl+gHsDfkVCcFBN81DRqfTaq9Sy8ogI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqq6AgttClmmkChG0ZmkdQ6r2jKz8tAoPbyceInO/QF73lwmuQfcunowc4J2EDkpdkREiGZCW/veaetvXjiGriqvEWLocAzEH3z+PIpwjB9KTNoseD2P7FZ/E/+xrmvmNLr/5j5llNdf2oh1Ho3wHug7lJRsTasvKVdRfPGK4xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6i47zZf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6i47zZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EFCC116C6;
	Fri, 16 Jan 2026 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768550830;
	bh=4/hROgGKG17UFl+gHsDfkVCcFBN81DRqfTaq9Sy8ogI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6i47zZfirhYGr4T4ZRg0wsLBr1/SYhhjkt/kof8sv2IGLv7Tu7WVhnK+zg10YfCD
	 6FTtnyZfDgMscYdmlrxmwNcogbR51dzlhnSQkuxRv4FJyT+i/haxCavtR0mZ9Ob+xb
	 lPgvoi1yYk3LZ98KM7uIojvGISV6n2l4fmP6GF5iIATUAQa2sVQ9V9kvA8OZA8ThXm
	 CyBNyu1eUiGWcf4pl5WXgT46kvtx4Fm8OCHXijTzVC9LrIUSms+yHjhWgnfC/0Y5AY
	 5TjsqHsrKbz1f/VbTWyxJgOeMLnM7BdG5UZhxOzwPgI+Xe0K2riqiBi7SJHt8/z5S8
	 yLQvhVvcjZxZg==
Date: Thu, 15 Jan 2026 22:07:09 -1000
From: Tejun Heo <tj@kernel.org>
To: Nauman Sabir <officialnaumansabir@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v4] Documentation: Fix typos and grammatical errors
Message-ID: <aWnxrTsflElnrWpP@slm.duckdns.org>
References: <20260115230110.7734-1-officialnaumansabir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115230110.7734-1-officialnaumansabir@gmail.com>

On Fri, Jan 16, 2026 at 12:01:10AM +0100, Nauman Sabir wrote:
> Fix various typos and grammatical errors across documentation files:
> 
> - Fix missing preposition 'in' in process/changes.rst
> - Correct 'result by' to 'result from' in admin-guide/README.rst
> - Fix 'before hand' to 'beforehand' in cgroup-v1/hugetlb.rst
> - Correct 'allows to limit' to 'allows limiting' in hugetlb.rst,
>   cgroup-v2.rst, and kconfig-language.rst
> - Fix 'needs precisely know' to 'needs to precisely know'
> - Correct 'overcommited' to 'overcommitted' in hugetlb.rst
> - Fix subject-verb agreement: 'never causes' to 'never cause'
> - Fix 'there is enough' to 'there are enough' in hugetlb.rst
> - Fix 'metadatas' to 'metadata' in filesystems/erofs.rst
> - Fix 'hardwares' to 'hardware' in scsi/ChangeLog.sym53c8xx
> 
> Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>

For cgroup parts:

 Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
