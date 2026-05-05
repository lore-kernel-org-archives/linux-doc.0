Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F29C4279E7
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986006; cv=pass; b=fmVKnlRMgeQi9AEAMDl/DsL9Ft69x3Yhh/26wyg6OVcm0pxQ7GRMypvveAQUnchmMPNIguQX22DaQeYg0tWUksVWPORCOkowt4JDFjVuKK8yq6q5v6YDh8ZHHwKt7lXJGKWvE3nhy8iGerD0HQC4E2bqcw4F5bc2VQ1cUTkmEAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986006; c=relaxed/simple;
	bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TphUZBgwUZn6kv0dHRN1U+irQ7Mv6BldoIlTVV+snzR/P0FYQ8nYeSs/+zZS5mhw7A9QFCzy4pyN8nwuw08jfEIJDOZNDY8YBzBF0GjocAM6l8n5qyYyg3b9Ky2sV4CXzbOnA8fIo+JMgHkCVKGgOtNsG+nNXD9HoXmIu8x83FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoeIVUHj; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoeIVUHj"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c6a2158d3so598928d50.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777986004; cv=none;
        d=google.com; s=arc-20240605;
        b=ThSBgQfHUYmv2o/N2o9mlKun03rMq3T1do/DZjdmHwDBC0+Bl8b/gMB3I40i73lK3y
         /kQetB6RWXKWQBh0q44QrWHUYaMKHeh/wJUn1irJ9T+hLhuyP11hlgV2QB1i7D/f3PwH
         5YMHVI9U4VQdoE2Y5BQoNbFcr9SYQsoJGzQuHfz4eBf3Nc4ZuqdZ67i6qqnJ9wwdEzU+
         lM7wDfNnefYJNlXxNhDJhXYjJUHpXogHiAdNilvPJa+DA/Fz1MSwdh3C+VAbt3Ud526i
         XmZFY+TqliXhaSVkOw3mmGDikEtngXIcgcI1o18HzMisUuU2MseCKsz0x+LvexLdZvfq
         MGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
        fh=bYJKp3fVGvokLOdjkqplAH8WLmJ93cX385nkcvm+GQw=;
        b=aET5QiICEnoi/UhTzJYoX73zCK7VtihBoPbIzWoKOGm3Erk45QMWIgdzq8Ztlih5PJ
         sEZw4NazEJwYdpUUHkjJh+1mVaXD1XzOVVNzcf62vHU9rou7h1DFcWBW8ZaN8oLw2z4d
         5spCJCtVeJBtdz4rYNF4h5Vm4j/QMdg5I6/GJLHOgLOrPtbslMHOHJh6d/a3BPJ6L5ta
         8o/j0bowc5KJXy7GNWYI3wOAike465QFN6ROIB2ov/ns+Qq5NkxkXhtLACqil40tC+Zm
         6ieFiWD9dJcvL0UzYyg36V7KMAp5cgdow7g5ihPgXFLkGpIT/uAdCZY/IwiHBaedAxQz
         GN9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986004; x=1778590804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
        b=GoeIVUHj2GRSwE5ou/UpPYcxlhjdEJHZaLKeWxmSqxeY3lNYSU4g8NHXz9ch6gB13a
         N4881PESspPKYX7E6LA+og9JEsQmJ5FCzOkU1w0Br+bAxaVIAHxGlkaVyl7pwEpElV7n
         5tX7T+qJ0kGHEVpkrtFk+q2HbU7+uO8YxCHcTa065vmMr5IlCtu+opdibqqNY3W5kiiy
         CH6Nb0rXM7zV2EI6CMLznwU6jaAkCMpNMSocPol0FKzv8vHo+2YfNflPeor2pvlIAKo5
         HnVtVTBhsmqM/8aPfgyxo4uRdt2IJLBtFOuQSMjN4mc4fzAuvTruMKDmvKJosgGWB9Kt
         f9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986004; x=1778590804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIDRLg2eWaFSrnAvJdPT6cUXbRWnjBe9GRrwIz05WwM=;
        b=agYRdFodejIo7vXCxfBsIBy1+vpbiAw68YwBQiQBXhNbQ+LgkVfvsjGsXNnzrTXys6
         Nyb+/pdPtl4o30+Lio5ZkAy5dnqrsglbNZAvlqxZNdJRXPaMocbAdkzycOKKzTQzL3JN
         q5U2sQaa+Djv7p9qgHRa8ia035cdALJfqmRIdjdfw+Jmpz+ROD7OrUAqqSHK98Ab6KrR
         6TipUXoJNTYIcHfWD7oweM03hxrTpBteYa5WkVlV+rq9jyA4RIIsE6DSatJsCbn2PFLd
         SHLRyesJd+MrLs4yDSE2Th9VIppFczPH7zitdHI8K+goY9tRaavARPXlCqgogA5X8zYx
         CsvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8jn+6T5UKt+zPUiBYB4sczmj4l2rt7SeZr7dFIRbJ1YcNVWdnVo7Vk0wOdoyAU5SADHHLmoK2NuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDghbSbxUQM02BlNPydx7waiu0EpJLEHcysz/70aCueibBXk8x
	gb8lUKFk7EpN3C0Jhe1dE1vE/7mv/WGkZ3E0h6Px9GuejUd/PB/qgtK4MM0yHGvB0A718uITX0R
	RqqP/qtzJu83jc4niieLAcYlgZ2RTtas=
X-Gm-Gg: AeBDietvzDrZs67PEFtsXgFguBF8VBWIN1xHpcijCvrjjT3u4aO4NJ2XEXWtu68Qyix
	fWBPd66cl8rggT5gtZcJ+ccGOG/jDutcdVD9pZR5Q2kXa6KqYztQ78ccKfS6Y8ehsn3p+ENkZ4h
	4ffY57dRER00SEq/I1AekCzzf9N57au0t4coKFdxdvY/XExh136w1clHpzcXAcx7nDfA3/Z4Uvi
	+KAJIGQd0ogPieafYX1fml74OS4nVfVuJxfokHOkMQmwpJBuSTWEag53YS9Um9Gtgv6hdw5Q9rX
	xTEaH7eIw21iHVmFAjNb0G611mAF4NHHD0lb6slgSfutUDnZssciAloTjRcgvG1RMbAdzg==
X-Received: by 2002:a05:690e:4184:b0:650:4a79:f3b2 with SMTP id
 956f58d0204a3-65c3da71099mr12790430d50.28.1777986004285; Tue, 05 May 2026
 06:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com>
In-Reply-To: <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 5 May 2026 14:59:52 +0200
X-Gm-Features: AVHnY4LkH-1c7-8LjQHE1WeKKibV23GXxWelkIeQtvvCstfkg90iy7cF21RDMuQ
Message-ID: <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Hi Julian,
>
> On 5/5/26 14:25, Julian Orth wrote:
> > In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
> > sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
> >
> > I've been using this interface, specifically the exporter_name file,
> > to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
> > exporter_name. I've been doing this for two reasons: 1) to detect that
> > mmap on such buffers will be fast and 2) to detect that GPU access to
> > such buffers will be slow.
>
> Crap, I really hoped that Android was the only user of that sysfs interfa=
ce since that approach turned out to be quite broken.
>
> It's number one rule on Linux that we don't break userspace. So I hope th=
at you don't insist on bringing that interface back, but if you do I will j=
ust revert the removal until we found a better solution.

Bringing it back shouldn't be necessary.

>
> > With the removal of that file, that detection mechanism no longer works=
.
> >
> > I'm not particularly fond of that mechanism but it was the only one
> > providing that functionality that I could find at the time. If there
> > is another one, ideally an ioctl on the dmabuf, please let me know.
>
> The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also con=
tains the exporter name for the DMA-buf.
>
> You can find the full documentation here: https://docs.kernel.org/filesys=
tems/proc.html#dma-buffer-files
>
> Is that sufficient?

I think that is sufficient. I probably didn't use fdinfo initially
because 1) it's a lot more work to parse and 2) I wasn't sure if it
was intended to be machine-readable or if there could sometimes be
newlines in the values and such.

>
> Additional to that the debugfs for DMA-buf also contains that information=
 and I'm open to the suggestion with the IOCTL.

My application runs as a regular user so it cannot access /sys/kernel/debug=
.

Having an IOCTL would be ideal if it is not too much work. I'll fall
back to fdinfo for now.

Thanks, Julian

>
> Regards,
> Christian.
>
> >
> > Shipping an entire BPF compiler in my application, which the original
> > patch suggests as the replacement, is not an option when the removed
> > alternative was simply reading a file.
> >
> > Thanks, Julian
>
