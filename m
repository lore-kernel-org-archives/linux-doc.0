Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC417F501
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214840; cv=none; b=J8xc19SfFecxh5nR8f9yXyhUigwsxiWU54CesAKpZmdTaBOuPJ8qwnNK62uKgl5evttjH+pwoXBE6GYUQJpgPUdPHwdHHp+WmgLFBUI2GJ6LahEp7+JdOz8k8CPx44V1cWyQDFTK0AfBWgcUq91j+86veQGxcqUo0KOwdlHcB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214840; c=relaxed/simple;
	bh=u2QoEwLJoX/vQ0Ubqa8Zd52sVn8RpYKvHli5EjglEuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Erugth3yWWhxnGzsdHFOmizc/YDaCZ8wjQamyvIcTqfaxbcn3RSVs0EkvyMnusxV8kPtq9s+jKy2LiZ6MchSLK0SgnZMJS72YwSbLsPyb8UIWzpX3rxwaTy9KWAHo3ACZfGXjV7aHR1MpmPU9t4IJV3x6mdZn5SrVilGBeCx+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ufG+kSfE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ufG+kSfE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44051a577easo482851cf.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1718214837; x=1718819637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMgLKSW0t1aEhKWe+AkntdQhxYy02qeLrR+2holCnSM=;
        b=ufG+kSfEBw2fv7uVH5tUqE4lo+dDlyN2LtlFRWqc0GYwUQW1slxI2/ABNNX/UThDNM
         zkkJYX2k+rHZZEjCAikFNW3uDbONbe+ahukKbcRUkf99Nuy86VE8ye7hsvuIIJCw2qQx
         Oj6slwXOHVt6GcdU/GCPTINP3UwNFU9z9SNmozsf8XIKUMB4vPbam5VRGyYZRZnYpe3U
         iWeR5kdpBfb/swvSlwzFyhppdN2lIWzVOgU6MQiixj/37ZEc5XlGZKeSEUF9xrqYxIO5
         BGoM72HYD2lNzhq/FEMCVmIupdPrS0X6g1uQtZ5p8GjyW8P8wWzvkFiWfcM2NnCdGDp1
         TBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718214837; x=1718819637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMgLKSW0t1aEhKWe+AkntdQhxYy02qeLrR+2holCnSM=;
        b=Ku0e+l4FPAGhu7JKR62KI+uKU6SDwFJ5L4xls85xYcQjePrU2cTGhITkFdHxV+M4i8
         7VTgE2w9qMwnUz60KpgnSnOQmlnmrBrCRI21+TwMKfUAnVgh0B9tYPaoboiJabUWJ5UV
         ZLInMEUr+m8xMc30pv5NhzdHvNvp4A0AM0WbWuf3cT2mWv2dRr1lukTVEuUzuUJ6I2qy
         toqgT0OaUE1qWhahnklsiuo50IkrV89t2+bPIzOXEQdA336pctn/PqjNkkY0keFDPGKT
         CsXxtQKszssrlagkZNa5Tg767f61iN96Ypi3y1RGvXFIL4+KarBwaiM/vHsCJohUkU1c
         hz3g==
X-Forwarded-Encrypted: i=1; AJvYcCWAbQffP4GTCpkqLJO8GvjD+kV0F+Oquq1orQ1CMpQ9kFxfKQqCdJCddo4qzyPHHq3K6OrIbY0DTBFmW7MrVtiUnoFfrD7O+Mdv
X-Gm-Message-State: AOJu0YwtkmOcPkFcjtsyBJiwJBiQ5NpnHMbzhBCU64d11l58oRI+jW6R
	HAyQ8E+M3O1CdBGIGIgRJD6k96P+aH7DRs5srvn6VWrbXUGoohur4u8KwyeI6PzaCxPOwxW19j+
	Xwd6/KB0WSYkLFtroJIZ0a37WUKhhCsFicHvvFg==
X-Google-Smtp-Source: AGHT+IEboSl6cuP7DdeifGdtYnGd5qh7/n6H6xuvUtUtKpoRuNfSrEar8wpjtJrO/8OKTRTzH9jgVk6mIIwRg3sA+rc=
X-Received: by 2002:ac8:5aca:0:b0:441:37b:cd5e with SMTP id
 d75a77b69052e-4415abc6032mr37434341cf.5.1718214837393; Wed, 12 Jun 2024
 10:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605222751.1406125-1-souravpanda@google.com> <20240611153003.9f1b701e0ed28b129325128a@linux-foundation.org>
In-Reply-To: <20240611153003.9f1b701e0ed28b129325128a@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 12 Jun 2024 13:53:20 -0400
Message-ID: <CA+CK2bA75p3LW95i79uiEfkg9AS0cKVfhKZMatHHQfRB4PJFZw@mail.gmail.com>
Subject: Re: [PATCH v13] mm: report per-page metadata information
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sourav Panda <souravpanda@google.com>, corbet@lwn.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com, 
	bhelgaas@google.com, ivan@cloudflare.com, yosryahmed@google.com, 
	hannes@cmpxchg.org, shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com, David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 6:30=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed,  5 Jun 2024 22:27:51 +0000 Sourav Panda <souravpanda@google.com> =
wrote:
>
> > Today, we do not have any observability of per-page metadata
> > and how much it takes away from the machine capacity. Thus,
> > we want to describe the amount of memory that is going towards
> > per-page metadata, which can vary depending on build
> > configuration, machine architecture, and system use.
> >
> > This patch adds 2 fields to /proc/vmstat that can used as shown
> > below:
> >
> > Accounting per-page metadata allocated by boot-allocator:
> >       /proc/vmstat:nr_memmap_boot * PAGE_SIZE
> >
> > Accounting per-page metadata allocated by buddy-allocator:
> >       /proc/vmstat:nr_memmap * PAGE_SIZE
> >
> > Accounting total Perpage metadata allocated on the machine:
> >       (/proc/vmstat:nr_memmap_boot +
> >        /proc/vmstat:nr_memmap) * PAGE_SIZE
>
> Under what circumstances do these change?  Only hotplug?

Currently, there are several reasons these numbers can change during runtim=
e:

1. Memory hotplug/hotremove
2. Adding/Removing hugetlb pages with vmemmap optimization
3. Adding/Removing Device DAX with vmemmap optimization.

>
> It's nasty, but would it be sufficient to simply emit these numbers
> into dmesg when they change?

These numbers should really be part of /proc/vmstat in order to
provide an interface for determining the system memory overhead.

Pasha
