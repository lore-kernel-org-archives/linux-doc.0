Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80161FC4;
	Mon, 27 May 2024 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716822499; cv=none; b=RZvDzqVGJwSqtNwNQqTge9CJ5iV7tWtDV4bWqFbWdPDIizP29KlxeT2QaFQzs3z4/zP3CLIS9aAn62MAj5vplRAJCxDpU9k+r0Ud+K13kOxMMc+BgzMl7E/8Pyp7OyfHhbMeF5UMT1gBpSmLylSz+awBNph2eKap3f8rI3LXAd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716822499; c=relaxed/simple;
	bh=c8xepSsNCw/pDJJ6ZpKZr2E007AqDxm7P8aGHdNNlWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQJmo4SC+RRxOE7jr/56jN9XZ7vF7k5itFHbyRQ+K4s3tx5Z7i3m9y8PTKufKDvn4rpTmfCnCMRRrp/fkxnlIMWpYpu/T2gjrRCaxJYJzTYbSfFO3cC2vUc5JY1M56Fqm/kqg7huWQpclzqwDpkojalz9xBFfjEHjr63anrjsfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+2mgekG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+2mgekG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3890EC2BBFC;
	Mon, 27 May 2024 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716822498;
	bh=c8xepSsNCw/pDJJ6ZpKZr2E007AqDxm7P8aGHdNNlWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+2mgekG8EG7qFU35dLx7XPdRV+vcKLDci2ly228W8Jr7SkmM0oKeENutlqXL3sS9
	 dz2zH/b6QeQJs1ZJ3+vW5t/jPS28sqrjUmFOqmZF3/JucX0WRVr1AGwlzYkpcZRF4Z
	 QdQkLY69z6yXqf/vWtJrg26kEw11t/47XdA1jQV/gT52NXhthGBN9MS+CnmtBfjEXL
	 TgYi4XHSRQVevrRD7/H6MQzgr9bNO96EFDBaGEXSONh3E9rl8bPquIf+cSJYR5222Q
	 gORkkbN2WjhCRbrYmfZwr5duCHdJ/qUcszrbw8Z6XWh+em2TRz5yRQQNkrHCBHm9cT
	 kkpYRi8pwZ27A==
Date: Mon, 27 May 2024 17:08:13 +0200
From: Christian Brauner <brauner@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: viro@zeniv.linux.org.uk, jack@suse.cz, tytso@mit.edu, 
	adilger.kernel@dilger.ca, lczerner@redhat.com, cmaiolino@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2 0/4] enhance the path resolution capability in
 fs_parser
Message-ID: <20240527-armut-blechnapf-086b9166728e@brauner>
References: <20240527075854.1260981-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240527075854.1260981-1-lihongbo22@huawei.com>

On Mon, May 27, 2024 at 03:58:50PM +0800, Hongbo Li wrote:
> Mount options with path should be parsed into block device or inode. As
> the new mount API provides a serial of parsers, path should also be 
> looked up into block device within these parsers, not in each specific
> filesystem.

The problem is that by moving those options into the VFS layer we're
dictating when and with what permissions paths are resolved.

Parsing of parameters via fsconfig(FSCONFIG_SET_*) and superblock
creation via fsconfig(FSCONFIG_CMD_CREAT) can happen in different
contexts.

It's entirely possible that the parameter is set by an unprivileged task
that cannot open the provided path while the task that actually creates
the superblock does have the permission to resolve the path.

It's also legitimate that a filesystem may want to explicitly delay all
path resolution until the superblock is created and not resolve the path
right when it's passed.

That wouldn't be possible anymore after your changes. So this is a more
subtle change than it seems and I'm not sure it's worth it.
