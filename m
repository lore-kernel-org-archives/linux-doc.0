Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777691E4A9
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 01:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728956940; cv=none; b=PP0t5PJT+0205ljT3/gjb5Uv0NSAkWqZTcDrlFHwZf4fgfq3va3P64JncjOl1RHakr2VZT4jyzieXKA+5OdPakcDUGZ2gpR//emH6zV79DlVTGgt36sLQ1G4SAbvj7FlU0H2K/fc0ApXs/HlawxJ4bgXjKH4ktih1jAGNxZ9Qn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728956940; c=relaxed/simple;
	bh=fiC+XBWxJTSHPbk3YDhimVLBmGOkquiWZQsNCDrm3uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkqIohS5zOpYV8Wx6SiIcmwa0Zs5MfKhHOEabMhMrUiQeeLq8HNEhm7GWzDTBmDcQubLXWtdHLFw59tP5e/QvQTgeqO/vgcd4O5rOQF4wz21RkDU7z3vWBSZIvZpZgeZk2JcUaKG/Or+eR2HbvCr1bCV7drStmPKy7aJted7P2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IAxMRgSq; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IAxMRgSq"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a3b3f4b2afso971415ab.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 18:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728956938; x=1729561738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTpr4H8C4FWrqjFNlXZjN+OALNaMX37MopaCmWm2Q8M=;
        b=IAxMRgSqOJpqOxMZeGkq45lPAlVP8D/uSav9ABE44MUPQMOIBVpM4r8zOJnQ2bfox9
         y2Z1w11vx76Kjz3LM4fqoWaJt7XCLCWjyM5Dw3hTFZa5XwJGJ+4FauB9biWvKHBiKAc0
         ezasCB8qB1aR4Ws3/JPS6hzRhgSfiZBCdCENU/f+ILRnsMRvFFKYJaJqnd09cPEPKVwW
         YhhDpNkNDAoygnyO4+1clyiVDBsaPLC/HLExon2QtdtoaApe7tSjmxHPSZW2Wzxl1+yi
         9Kg2v7RdhcjjU7uZuKPrFVHzYrLFBj5sSzxl0immuAAFmiaCw7O83Y4mhdDgqPoaDKKJ
         yomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956938; x=1729561738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTpr4H8C4FWrqjFNlXZjN+OALNaMX37MopaCmWm2Q8M=;
        b=XphEuS4fWzhFbO1MQdDtYi4RHpWAt/5Rbe+o1ZxeNgv3VTssSx7E+U1lKtbYY+9LFo
         Id63uHfzg7jZ2qrg7EHqQjWplXpm9yQVYVOHI/ccJvtbZv0kL37Z0Qkdi6YIxaN/WIIW
         RGMwq+KTrZFqDwll4ECLmTh0xmSzYnnjiVex0/zYzTSr8xWs2iAPihwBcEHrvKwLy0d9
         lnOelubFHOcMyjoX1XVyTMqUjF72tTLiRjUpQ12vCescZg5keVgl1SszMfk3exqeYC0b
         jJEnLotBNSACEgEyPzOFMK6lnh+9wn7m+OA1MgxefVAVDKMLIBw3eDQ6TpveosfWss15
         SfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuMt+G1liTYbQuN2IkbebkwTjh06qpIxcp+UOctyLIzRPfnGi+sL+lwcV5gCAJnGfV+GhFYZlMUBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQIbqhx7+1DDaF1z/9PQ6+r4mY5Lx2dTlGpWPZQKJKdiLQYUq
	vTqnUtDSG7tFyuAKB96yhYcKceLnHl8U2M4mZOqztn4wg4mU1shc60ck/SLT7wlL+Cvv7DWCERT
	1B1DkmFt6crGdbkasRuviIG6HwFk/gNzJefk8
X-Google-Smtp-Source: AGHT+IGesUbiPOAGaxIbzzDgO9fqyDFQzVpz+70lg/ZZegnkGH6H5WSOBtADDa6r+PO3K17MJxP/ANuwhYpFXw18SQc=
X-Received: by 2002:a05:6e02:1446:b0:39e:68d8:2891 with SMTP id
 e9e14a558f8ab-3a3bd2cb5e5mr13845395ab.6.1728956938353; Mon, 14 Oct 2024
 18:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com> <20241014163231.9ef058c82de8a6073b3edfdc@linux-foundation.org>
In-Reply-To: <20241014163231.9ef058c82de8a6073b3edfdc@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Oct 2024 18:48:45 -0700
Message-ID: <CAJuCfpHo=gu-JJ-N_nU_3hX4HEsfsQ6=ff19vU=NCrp1y3abiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] page allocation tag compression
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 4:32=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 14 Oct 2024 13:36:41 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Patch #2 copies module tags into virtually contiguous memory which
> > serves two purposes:
> > - Lets us deal with the situation when module is unloaded while there
> > are still live allocations from that module. Since we are using a copy
> > version of the tags we can safely unload the module. Space and gaps in
> > this contiguous memory are managed using a maple tree.
>
> Does this make "lib: alloc_tag_module_unload must wait for pending
> kfree_rcu calls" unneeded?

With this change we can unload a module even when tags from that
module are still in use. However "lib: alloc_tag_module_unload must
wait for pending kfree_rcu calls" would still be useful because it
will allow us to release the memory occupied by module's tags and let
other modules use that memory.

>  If so, that patch was cc:stable (justifyably), so what to do about that?

Now that I posted this patchset I'll work on backporting "lib:
alloc_tag_module_unload must wait for pending kfree_rcu calls" and its
prerequisites to 6.10 and 6.11. I'll try to get backports out
tomorrow.
I don't think we need to backport this patchset to pre-6.12 kernels
since this is an improvement and not a bug fix. But if it's needed I
can backport it as well.
Thanks,
Suren.
