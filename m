Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099688;
	b=IdFg7hIpJIYjFOso3urJwlbEdSidg/13PD7NC4fszA/e4n9fmxOWQxPRGtZ1pe61UDer
	 QMwjM8+gHU0rRXUWj8YZ7phowQHWQM095hWdGiN6MEwoUR096vzWGEtBlqFqfk7uwl3y+
	 sBvw8F5nLJpLYEqjUdYPBvJGbEWQLD0bJ8pZGbwEQrE/thhQLV9QE9m5NsuFIZ15Txz0t
	 qHSzgfD6su4ujKd2ffame/7ZgnhaZ15C9YtfFm7/JMTnyK0Y92vrkCglol8dSZMStLatY
	 eYPikxMB8qvnM7U/udiEoijoW9VKvUwRflnNwuURcIovjPoe8LIIkOlkwlb/7alltMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=f6Mo71jgG61v6yCOuzdG4wSagVHN3ZjNtEaoKgIkXpo=;
	b=420j5jmCvwaLjhtLPehhsa92IxDDG//lGGusMxOCXhsttYzpVmH92fsVBJobwdFJMPb/
	 W5IIwi4VL0eWBl2vCMkZ7HAFd8kX5RVHFeBxwPOyOFhKRdONv+ba7zFcEgxSR0QDFU69i
	 Elskeb946oucLJyEojgCIuNWOJPS9BItN/EIKoU3d0shBWkCtSSGQNHkKMlEMPE3dMpRS
	 uVsqaSdoZI+h1WOvrnkcvjIv7JDs9P40FlyLlFYnMMx6g2fAEWdjZP3taeZA820jsYXNk
	 yFvXbuqokXXBQBFWpvAstFATwyXgU2a6SzkEKUq1N0CDCzD2VWQGpfjZxshe+72XXdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=NhNeMwSW;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA860A6F66
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AA860A6F66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=NhNeMwSW
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElc4A017939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099661; bh=f6Mo71jgG61v6yCOuzdG4wSagVHN3ZjNtEaoKgIkXpo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NhNeMwSWeQHWTg541UJujQJnXZaUdLnIkDQBIfUjhO92HjmSD78mqCQPowosuY4UP
	 BKuF6gEAagxzv4Ea2zIdiV15GBtf2SjwxLj29Hfo5uamFWoftCJfU7ARk28Bbull8S
	 gZeX8JSsuFVRQIv9wABBkl1aJt+dLbHJc7nA8aMqvicXuW3YTBgn4DfITb54765Hs2
	 D60K1uYyei78l93v2mBYSWk5x+MZ3PLFEWM9Xh138rkPI9GT6KwYwSlSvPcGopWbPr
	 wQdX1A0s1ZR0K0HBq8BqknY9kcjgi8xQKBD/CbrWnobW4fQfe8KaqjkPRQjjZWqsAP
	 wka3Ug0DfzofQ==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id E11372E0154; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Daejun Park <daejun7.park@samsung.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4: spread files of sibling directories over a flex group
Date: Thu, 19 Nov 2026 09:46:45 -0500
Message-ID: <179509948706.1938961.8437837865021629117.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013-ialloc-flex-spread-v1-1-9ea1d86961aa@samsung.com>
References: <20261013-ialloc-flex-spread-v1-1-9ea1d86961aa@samsung.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 13 Oct 2026 16:28:52 +0900, Daejun Park wrote:
> On a flex_bg file system, find_group_other() puts a new file in the
> first group of the parent's flex group that has a free inode. Orlov
> usually keeps a directory below the top level in its parent's flex group
> and packs directory inodes at its start, so the files of sibling
> directories come from the same group and get consecutive inode numbers.
> The flex_bg path was added by commit a4912123b688 ("ext4: New
> inode/block allocation algorithms for flex_bg filesystems"). The
> non-flex_bg path instead adds the parent's inode number to the starting
> group once the parent's own group has no free inode or block, so that
> the files of different directories which share a group land in
> different groups.
> 
> [...]

Applied, thanks!

[1/1] ext4: spread files of sibling directories over a flex group
      commit: 7923d83bdf8d8b21394789167ab3eeb0130e90cb

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
