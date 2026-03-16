Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA593988FC;
	Mon, 16 Mar 2026 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668657; cv=none; b=XuS7WVbp8hslVk9SCcBjTk7VKtO7686O4TywP8G5ksxv9cCnWqIcm78kSzPVt7vouW4vRSmfTh79ye72dUn5xywPk2QE4HLJBHDOItHyllgykk4vsXx3OeoKhIjA0TRpzVo15AO+Ihk5dawLrGhiflSjWf1pCzetUjuRn8pqL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668657; c=relaxed/simple;
	bh=AX0UsN8O11oGeiC8a8COZbGwOw0yUhHNi+K5aaE48Fo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YAJZUXYtgoHOAvHu/zzjvSftif1Q+Awr+n7MXnOLSpS5cIoDtsAhBZIMfvrCL3EwaErcJ8SZ3FWkG8+kt92awUMEfK60zzH4apphnXn+qUirIth+EPwJjAuJJANyWnUL9xKhZCebjN+YeNuaq+DoP1lfd6m3aJ2KOahfGZbQtVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rPIkrdqT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rPIkrdqT"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 73CE141209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773668655; bh=CiPNXJ99QejqzgrPoHahfnknnW+u0eriWi8xG9cmEe8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rPIkrdqTLBwwkyYxvOR4K61M8+vczYmrP5wDDKkqWstRpFvzPyim55JSZmn9m8QnG
	 OyutYiMtY6dN4S+95FKs+VX87lkLLhd0v5qkhVA6om1xw/ShDl7F+NhmXd00/D1y+E
	 ubVgyHOch+f2MdbLvO6u93qX/Wr69D5cGw3bSpvVYNd5Sqi5j3g9EMuEsIz5DcF9Yp
	 PVo9ERdK+pSZvd+eMIECR+YIx+VqITnKkalX/wscJKbFQN+5Ysz/eD8pNDwm7wV6pw
	 Dio0XHocYl4R7uk2W0aTuYN3DDBSQ1zKK0MNvmu2xhgYUimIA+iBGzZUNmPvYPinXk
	 OJfPWfKcINJgQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 73CE141209;
	Mon, 16 Mar 2026 13:44:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kit Dallege <xaum.io@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/3] docs: sched-stats: fix misleading 'per-process'
 wording
In-Reply-To: <20260315170521.63794-3-xaum.io@gmail.com>
References: <20260315170521.63794-1-xaum.io@gmail.com>
 <20260315170521.63794-3-xaum.io@gmail.com>
Date: Mon, 16 Mar 2026 07:44:14 -0600
Message-ID: <87wlzbj3dd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kit Dallege <xaum.io@gmail.com> writes:

> /proc/<pid>/schedstat provides statistics for the specific task (thread)
> identified by the pid, not an aggregation across all threads of a
> process. Change 'per-process' to 'per-task' to avoid confusion.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=202635
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/scheduler/sched-stats.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
> index 9d6a337755f4..9187cb6ce1cb 100644
> --- a/Documentation/scheduler/sched-stats.rst
> +++ b/Documentation/scheduler/sched-stats.rst
> @@ -190,8 +190,8 @@ of idleness (busy, idle and newly idle):
>  /proc/<pid>/schedstat
>  ---------------------
>  schedstats also adds a new /proc/<pid>/schedstat file to include some of
> -the same information on a per-process level.  There are three fields in
> -this file correlating for that process to:
> +the same information on a per-task level.  There are three fields in
> +this file correlating for that task to:
>  

Until you've copied the scheduler maintainers, a change like this will
not go anywhere useful.

jon
