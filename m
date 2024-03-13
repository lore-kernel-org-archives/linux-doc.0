Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F6E5490C
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710369514; cv=none; b=rLu6Ny/8wE4z1148rMl/U2RhVt61qI5VxoFcGJF478KTe/RyQcwUwpvaazDoH3QlWlFeOqqJnZloXtRjT7y23yBWzNkPuulZztPaye+nPXeT7JoWc5sYJnCQj6Bd9LF7etuPrJk0QkkkE2tEfGF2y3NEaK1+13PGpjMWJOFytO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710369514; c=relaxed/simple;
	bh=/AeK6IryRQEcZsy2w1FTI8NpS8Vj9IE8PhmQeFns2gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ce+fxYIVTSW8z2uVKYGOCAQWWJJcq8sfnZNozRLC1r+IUvFxONFG4Yqkz0rNt0pVIiSz9jbqdI7UD7A4k0ZjyKty3tA13zT1+uZl7+KaBPm+L3+kCHFOk5YSKS2rQmhDO3S7RzrKqxkL99BZj5PIm07CU8zD7VRkBQgHw9KzKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=AAvDmDtL; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="AAvDmDtL"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0579a955so4615457b3.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1710369512; x=1710974312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AeK6IryRQEcZsy2w1FTI8NpS8Vj9IE8PhmQeFns2gg=;
        b=AAvDmDtLRvPhQjkNy4GbjNZNH7YnTwOMBjzjqLls2aTQnvALkCWDfq3sBRmYtY66NT
         8mvwm2h4p0nD2RN3MdjD6Ym6M6zunbIawW9Jdcloem2jeb17WGcXdy7X30CxLPh7EXkq
         rabuDO4SlRVoR0PUvYNDDq9/9VBBL82caRRQXSip2tDHJeGXvNPmSxZiqIBZ0TPYZFcY
         oLl9i6Fol6c/uC7tDy9lt6k2lS2uQyZ0eEsaErQjRu5hbM7iAW1DNkWSbMtDi0jXxi49
         7jBZwYD0OiuPkIozy1PiE7b6Xr0g6cFB9OuTOgxJK9YlqoKsiTHtpZKygu7HV20j089g
         JV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710369512; x=1710974312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AeK6IryRQEcZsy2w1FTI8NpS8Vj9IE8PhmQeFns2gg=;
        b=bkSn9v44ujTisfueFNJGEiI+FwzHGA9jZFQmfzCon75H2XFJ752Z+4nNcKSTXAGjjZ
         zlkTfBDx/WRJ70dfGXM9OWwuL/K/6RdSN597yy+pCeze+dB/BT+26Ekv7H0kAW/+8QNj
         ud/swiHeS8HgGCSXGJRtDTl7rzZn2wFhfNOkHubUD2QmHVxrhYdReatmt1xyAzZpGcK6
         uAHblA8Q5yip0wt39KdVMU1y6XvwfD5DHWxz+/dExJQ2Oy/nbuSnZ019E9RdMT9fGo+5
         IrwKfJMxwykzP8/CpISJF9xFkcBDaYhSOW/749l1bUU3XoQaFLA3vf1QHysbxyVYS+5d
         Yfcw==
X-Forwarded-Encrypted: i=1; AJvYcCWFCoKISBJCYyISETrpvg7XTmANKPSjcXBFWIsyqU3CngO5qRLfKwkXL5/9ghjci6CMesy9U/NhdFPMKQstpklpLJhqw36zIub+
X-Gm-Message-State: AOJu0YwMSR3U5eXQPaSgOqnX5KWPFYx9LxFUgSumxUupOQkKQBIExNyC
	EoVcz1YR3qk085ZsMvZJ75yh90A8g7+Pj/1TbNUW6WBtJCLKIpg8gm4Bvpu6stV5Aqg5tUyOyr8
	OpZ4lKGCsVWOH3nGVw9F9xmSG9fWZ7Ga8JyTOnw==
X-Google-Smtp-Source: AGHT+IH5HYI6/U5oWgLdvGxeY0fpFg8OXqHHr5ZUzkK1XxyJyiWCmyb/BKEtIMTTf0er7LlSWB8J4HGSxys17t9+Qmk=
X-Received: by 2002:a81:830a:0:b0:60c:a4b7:139e with SMTP id
 t10-20020a81830a000000b0060ca4b7139emr13653ywf.16.1710369512263; Wed, 13 Mar
 2024 15:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220214558.3377482-1-souravpanda@google.com>
 <20240220214558.3377482-2-souravpanda@google.com> <CAAPL-u-0RekH-ptg9U2pzPJxCAR+jMTxKTZU49LR_isjNkSPWg@mail.gmail.com>
In-Reply-To: <CAAPL-u-0RekH-ptg9U2pzPJxCAR+jMTxKTZU49LR_isjNkSPWg@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 13 Mar 2024 18:37:55 -0400
Message-ID: <CA+CK2bAqdFL-kGmTR8msdy_FSr4Zt7+riJgjdTxX+FN+-M0pLA@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] mm: report per-page metadata information
To: Wei Xu <weixugc@google.com>
Cc: Sourav Panda <souravpanda@google.com>, corbet@lwn.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, akpm@linux-foundation.org, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, rppt@kernel.org, david@redhat.com, 
	rdunlap@infradead.org, chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	yosryahmed@google.com, hannes@cmpxchg.org, shakeelb@google.com, 
	kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com, 
	adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 1:12=E2=80=AFPM Wei Xu <weixugc@google.com> wrote:
>
> On Tue, Feb 20, 2024 at 1:46=E2=80=AFPM Sourav Panda <souravpanda@google.=
com> wrote:
> >
> > Adds two new per-node fields, namely nr_memmap and nr_memmap_boot,
> > to /sys/devices/system/node/nodeN/vmstat and a global Memmap field
> > to /proc/meminfo. This information can be used by users to see how
> > much memory is being used by per-page metadata, which can vary
> > depending on build configuration, machine architecture, and system
> > use.
>
> /proc/vmstat also has the system-wide nr_memmap and nr_memmap_boot.
> Given that nr_memmap in /proc/vmstat provides the same info (in
> different units) as Memmap in /proc/meminfo, it would be better to
> remove Memmap from /proc/meminfo to avoid duplication and confusion.

There are many items both in meminfo and in vmstat. Given that
/proc/meminfo covers all kmem memory, it is beneficial to keep the
kmem part of memmap in meminfo as another classification item.

Pasha
