Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C45C221DAE;
	Fri,  3 Jul 2026 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783105525; cv=none; b=pXKxzgKxqF6nBn2E6uArhclHRpTf2CMOPM+PI/rwKrRixgFksDnDNclWSqYG/fUsZTvdYEVhex4FEmNB55SO9TsGH5XFiBF6VJ0sZPxx6d5R1ht16Xh2CLJQOx156jobTabNJRv+mOcei/mZTcJNGKABogQduNP7TatmiXT7rJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783105525; c=relaxed/simple;
	bh=hBb6hq4isCfiV8s+nzMNOuu/UNXr2UNwuxWVfeZLujg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AfFIy0FCYbI4YWunSidNzUunG2OH5x1ZrCMkaOn/BDSA5CJ3dY9GuDsyF5yUaD2F74YS1zKVjAiB9HoF863HK3ipzYg4teUbGSX/SaCelhv5o8m5WRPbOGOkmHk2SZnuxzrvPq3PzrAJ6a++HcsRPVYvOc7Em3Iq9qnRbYTLSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1zyTKW0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1zyTKW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415E41F000E9;
	Fri,  3 Jul 2026 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783105523;
	bh=bbmfpKuaXnCxb2nR08iPDH1KoBeMW8P78cZz/yvJGm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=m1zyTKW0qm7fBkbyTAj00Q09+0QWQ24rD620E7z5vDB5fh9BcOcu2kHmAAXQWi9aa
	 jovqqKWVrXz2T3yA+dDQ5zKLP5EJ+0psSHy3ybbsBgeU60QEHm5pZErF48sjtZH8PP
	 hlatZTm/mJPtRJTWBabeJ3IIxKmOAt/yWGe6Bvo3c0b5rZo+LmxJ0yERl6GlqXFxC9
	 OcRMXkff8JEdS5b95XW/5IW/fxDpisss7qzaKf+qUq/qZ7X/dkRVp9I+TUvHui1N3G
	 ZjOwCrZG8eM1lK4eF+cuAqeLYXz0Ui/2B/oRZLanhq7Mtad1Cf6be8OSY2abnA9PEi
	 HWRAHGy0WPlDg==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, corbet@lwn.net, skhan@linuxfoundation.org,
 peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
 feng.tang@linux.alibaba.com, pmladek@suse.com, mhiramat@kernel.org,
 marc.herbert@linux.intel.com, joel.granados@kernel.org,
 lirongqing@baidu.com, kees@kernel.org, nathan@kernel.org,
 linusw@kernel.org, arnd@arndb.de, deller@gmx.de, jpoimboe@kernel.org,
 ruanjinjie@huawei.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
 ojeda@kernel.org
Subject: Re: [PATCH 1/2] kernel/entry: add CONFIG_SYSCALL_USER_DISPATCH to
 compile SUD out
In-Reply-To: <akfv4ecFcHMqx5Xp@fedora>
References: <20260627205551.769684-1-gourry@gourry.net>
 <87a4s8m69c.ffs@fw13> <akfv4ecFcHMqx5Xp@fedora>
Date: Fri, 03 Jul 2026 21:05:20 +0200
Message-ID: <87y0frlwr3.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 03 2026 at 13:22, Gregory Price wrote:
> On Fri, Jul 03, 2026 at 05:39:59PM +0200, Thomas Gleixner wrote:
>> > #include <linux/thread_info.h>
>> > #include <linux/syscall_user_dispatch_types.h>
>> > +#include <linux/sched.h>
>> 
>> Why does this require to pull in the heaviest header?
>> 
> we dereference current (struct task_struct)

Who is we? :)

