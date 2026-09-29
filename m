Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EDE1799F
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 01:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643960; cv=none; b=K8T5DcKGE4d0rkneUcQLwRfgSWA4hHdW3lcGZoEhybkKcJszRfEZpGu8Awb8HgbEwHDe5wU0MSuI3+8EcdJrKN7fFV2uf8TX2ycpba3UWUuI1O9b7wQE0jPTz+U+AcmAdxEiCVUVi0j3EeRh5vstRhZ7cbFRJTrzsqDf70q9ZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643960; c=relaxed/simple;
	bh=MguE1Q3lxcAljs+2zypbm6i0Ae6VoOLHXGH5eVGcYrA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pg0qZQ8Px1c54GymVqz+M8j2vCKiw7dHduQYsOI8BVy8jDBKvdVhkofyG2FZmrkoMTvgSLKwnDoJtdK50LCl3eLZ62kglv/zRhtnyRIYWXpVjkIs49zN0kRwykJYDL7M5IaQsJaKW2LzE77PmdzDMBIGc9eTdr2wlVTXdeHHSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnHtspjH; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnHtspjH"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d5764feso804643a91.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 18:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643958; x=1791248758; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WSPn2rseK6a4IufNo372qRJbii4TFE3JGpArxCTS3Ec=;
        b=WnHtspjHYJ2Y0CIFeh3qkNBiZz0XeT9K1kA/kV1r9loRPTqyXjysG6oC7eVUWxWjYv
         f4X4Fj8+VRVbil7Qj171t27/qeK0d5p/BjcYN9Eq/VnN76w7ErYJllCeUdDqR6UxFO8e
         b5FGQ47tk+aL++ACDfxph2+q0cJH9lb9VCBKRqouQ3yvKL569oYCzILGVKqqiszjqxIJ
         6Z03AP/scdHgYjt1YYLGIoUiec5TCkHC5WGlvbcFUUtzn4KwQpngGWZgKPyIJDzHBakX
         JtJI0PDLYBE0cM3UH3yXnsrZdCTLS0E+4FDbJgrVUd0scab0cHAE+HPAoeV0265Ug9hQ
         un/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643958; x=1791248758;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WSPn2rseK6a4IufNo372qRJbii4TFE3JGpArxCTS3Ec=;
        b=QfOfhBkHxw6H3JAZ1aggF1iMAh0fBxSF/meEoZQD74X3b4wnFhQostVQVNTH751J12
         4J/lEcaIs3Xyok+uLSUVy9yotrp1WgYX+8Hu0MuNjrwpRM9tLf50xELqiDQZ/Xxc1zxX
         diCgn36qNl95iJzleW8+ZqfUbTCuZFfTiecGEcXvFV7SS8JDIzIHRrklzvULoU+4yCFK
         +0ISX0brYmDw6uT3XccHqs0FyW0Th/hge3mKuQWBmNd/ZsnNnMP5+7kC/UP4ft11YEXE
         UbxEXHhpgf99r2AXyQGPf5RqIJGr0qbWHQWkgi93ZuKhvSehgjf1QdbxtnHs/JkQSzyg
         Phxg==
X-Forwarded-Encrypted: i=1; AKwUvBwobSKAzMiIVdwpoJ8RGiAZXi78X1Au7sNf75rUsaNgLREG1rd/9uk2+UjoYLSnq1w1HWPGo3W/1/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL70FGKDEpQkjhC79lBP6jFlwkixYkTBJVLL6kjRx0ir+wTy6zB
	0NNizH9P5pi8CaQBMI3XAIBkcaVs2cFOxLVKU81eK4JziJ52PefukBIY
X-Gm-Gg: AYBFou2QK0MydcwLjAK0UI/7DzG8a3CCG77UhFVxWSepux73+zcBMTQw6fD15MPakmz
	+Zcy7xnjg9xJw6nicsRZ0GBd7IaB4+UXoCAhdnNF56gsGI+3m4JOjygibt0CNbV6pUmZ8HnTXpL
	QoQA89KgLXPPIgM7/v3irOeNksxaCpB3gRW+I5qVK8Pvc5EoT7tfcyFA9EU+36MXfHovSyH1bgY
	1BBtUCJ9JRuVJEqpLDFZbLMfLZz4rcJ58HIG2x6uu6JqKwM7przyEPUVGprHILXzApJVsCkP0yX
	1AIVOai32M5v7aN6e22GBkzP2QEtuK67rN+7n7mNtQakjGg3pmxMbBxS++8/H8JfqLWhUCmKyoq
	u59uzEJ3o2V2Xd2Oo93gT0j+KT77Banb/BIdXDatZkYy0us/YHDdTqQKaLbvzv7hPIWO5sxcq4T
	3Vn1yuNu3HkcsGWJppTSq0Fc+/k4OzOQlSu0mnmvtUdMWhuH8D1zjSmnQFJMhbBNdYgw6+BwaoK
	iwnCVV7crILt/u1R0ziSQoxQ7ZDaD6KFLk5bO8vuPwNX4uGtBCSzWAAd2uM92aqZ/E68Z4kGg9a
	XV2ON7aKRrn2vYVtkeMx14v38Vu/SIY/b1lv1GmIYlR54lulv9IWNMkENly/8f5jIDulrA2G/zE
	m
X-Received: by 2002:a17:90b:50cc:b0:3a4:9b6e:2996 with SMTP id 98e67ed59e1d1-3a49b6e3900mr809185a91.36.1790643958360;
        Mon, 28 Sep 2026 18:05:58 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm2135265a91.7.2026.09.28.18.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:05:57 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:05:53 +0900
Message-ID: <m2y0ck3lzi.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: pfalcato@suse.de
Cc: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v3 1/3] selftests: kselftest: avoid cd - in runner
In-Reply-To: <arqu1zdvMBXDziRX@pedro-suse.tail5790ac.ts.net>
References: <20260926010819.604346-1-thehajime@gmail.com>
	<20260926010819.604346-2-thehajime@gmail.com>
	<arqi6iwLDDBlk6Tm@pedro-suse.tail5790ac.ts.net>
	<arqu1zdvMBXDziRX@pedro-suse.tail5790ac.ts.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Tue, 29 Sep 2026 03:16:48 +0900,
Pedro Falcato wrote:
> 
> On Mon, Sep 28, 2026 at 06:27:42PM +0100, Pedro Falcato wrote:
> > On Sat, Sep 26, 2026 at 10:08:17AM +0900, Hajime Tazaki wrote:
> > > The kselftest runner currently uses `cd -` to restore its working
> > > directory after running a test.
> > > 
> > > This is not supported by the minimal BusyBox hush shell used by some
> > > NOMMU targets. Store the original directory explicitly and restore it
> > > with a quoted path instead.
> > > 
> > > This also avoids printing the directory change performed by `cd -` and
> > > handles paths containing whitespace correctly.
> > > 
> > > Cc: Shuah Khan <shuah@kernel.org>
> > > Cc: Kees Cook <kees@kernel.org>
> > > Cc: Andy Lutomirski <luto@amacapital.net>
> > > Cc: Will Drewry <wad@chromium.org>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Brendan Jackman <brendan.jackman@linux.dev>
> > > Cc: Hangbin Liu <liuhangbin@gmail.com>
> > > Cc: "Ricardo B. Marliere" <rbm@suse.com>
> > > Cc: linux-kselftest@vger.kernel.org
> > > Cc: linux-um@lists.infradead.org
> > > Cc: linux-mm@kvack.org
> > > Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> > 
> > NACK.
> > 
> > https://pubs.opengroup.org/onlinepubs/009695099/utilities/cd.html
> > 
> > -
> > When a hyphen is used as the operand, this shall be equivalent to the command:
> > cd "$OLDPWD" && pwd
> > 
> > which changes to the previous working directory and then writes its name.
> > 
> > 
> > If you're running selftests on !POSIX compliant shells, that's a
> > you-issue. Fix the shell, or use something decent.
> 
> ... I realize I was a bit too aggressive but seriously, lets not support
> broken software, please?

thanks for the comments.

no, your comment makes 100% sense to me.
under fork-less environment, we have less options but I agree that
this should be addressed in a shell implementation.

I will try to fix a busybox shell and drop this patch from next spin.

-- Hajime

