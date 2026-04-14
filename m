Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86193EF65A
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776187976; cv=pass; b=Onme3VGVwhJTC/mpzxFzTrILRd7zJb04S0yl/dltT8B1SCARh4LA/j5GQ2aw75inp2QZ8ngygfkGvnXGBl9Xa6K/BhbSEp3wGp6AGFEY6LZ0rBCLsqD8a5pP6iJhkPcANJlFlh5usV236f5ru99MEUUBrwQoP1219vGWI7zz5PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776187976; c=relaxed/simple;
	bh=c8VROB7nPEHNUyRB5MclbcMkN39zlz8ADjK6buJJwrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoY+ch8S4IAz0Vi6td98u5eQ2ohQcqUsa9vrv5LI7L6MWWGr6iU+EXFzo1F7Zqbywv2vUiOW9ervoY31VJ5YN1OZRwTORYrX4aAXdg8gDOgN5+j2iY0F2/3aAbitfa936vqZ44wTXr6GStUcMqmLxgUR0CfyMZH8o4W3I2vqhHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX10aqTN; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX10aqTN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso62630865e9.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 10:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776187973; cv=none;
        d=google.com; s=arc-20240605;
        b=AJ9QBPN3ojtMy9y4lVKFKM0mM7VV/PVqJJDS2I8tOIdNIoDtIt8U1EU7XaY1+2dDRQ
         8ty4FgIj2FZ0WsjjGSKnNi7tNm3b0bkTFjgaqXQH4p4oM1qXMn44s3Hq303Al9cRfG3/
         WbgtmxD29ld91i0lFspcFjpsJfaRv+p8dDY69pDw8svHrozpf6u/2VJ1F4NFFBt7qWCZ
         Gpt3eq80i36ynD/hGTRcFAjYKmjub+GsQL7z/HB2uKh7lBCENvMZHfI8ROi9TtSLJTq9
         arg+h0U3HHImDPVBB7Fm7hAx9fGCn3sc0RrCKqkj7z7WWNyJCc7a2leKjOEf6RmLk5QU
         69+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8VROB7nPEHNUyRB5MclbcMkN39zlz8ADjK6buJJwrg=;
        fh=tCKnubBDSvk+qMdhOm3vbY88BLhxRLx+wMIQR+cKnyA=;
        b=CQctZsGlGZa7Zcvv1PdsUwBbOHdXp/zWXOyyM7qjos99DWpduJ4vMnRHLcqJsVvOpr
         M7/tRAHGR3I7vs9+XR7yUYrhXPLiLcEhsU62Roo0cKPRUJcDSnpqUBu+yA3X+rxpaA6s
         zOLvkNgRvipw1bWAApjzkWAMS37LPUx/LPmR+TgLFucvzGoW6dbuZZYipGgOy+qifMkZ
         Kpd2sa+4X5QYXgJLXS6U7HC7iTH1hwEizKBh7wIb2B1IhVv/i8jdwnsf7hJOZabNdyj3
         jcFLTTsrMXF60urjaf+8QsEmdBErCQ5ZQFKDlQn21I//xvbOiSeFWINPbpoAGQBQmSEx
         PrZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776187973; x=1776792773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8VROB7nPEHNUyRB5MclbcMkN39zlz8ADjK6buJJwrg=;
        b=ZX10aqTN6ueyUDSbjhQxBmYCk+6Qh4RbTFKz6qsoVLZ8XXsN0jMCDoVnjk71jKY2is
         GKgIWSzeaYIPOPqiw8qIfwjP7sVd9qedkfhH5Mva6wk5h7nNaNywd1n3HqEsv34tqhoH
         I8hwJhRvdVYtqNpl/gR1ddpVQqOCtsgP0183AFph3MBF4afg+LoFr3ZpSX5DLKimtoyF
         mCEtFU+t8IDjK7In/U7uTxNDiIndapshHTqfCe/dn+zyWu4veJEXYT0Yu2MQK90BeV3b
         IDhR902SJ6cgHedCu4VOcexxfkw0KCXyYs0CfxieXZxftaZiOjUomdtveXRhB9JgTMT0
         DiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776187973; x=1776792773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8VROB7nPEHNUyRB5MclbcMkN39zlz8ADjK6buJJwrg=;
        b=MayA4dAxDCUUdCe6paMzc4Y16aX9fjgLUtPwtJDsHpykw5smR2xOIPgQX4E2Xea3Df
         9WPqonRfVYEoyEuAiQgQ0IlYBqajugkkSMDoyvEaFQgEQgjaymPDNIeGhJm572aD8fhU
         39ztap54uhnOqupfytWYir0t9uZ8QuJJI821oFpZUeQH1A2obd7aGoJSKzG9Lt13BgJq
         ZYv8rmO/riVTzhlF+fYSj1gxL8S23mcDdo+ehrIe95ksxsftp140lWGX1+s9glCsmCG0
         rkGO5e4ualRuFwQtevNX730B6V5g9G9qm3mBRWV06yNmruLP3z1LVxwr9BibpKmGbh7U
         PF6w==
X-Forwarded-Encrypted: i=1; AFNElJ8/pS6Ch/x5sRDcmqiBVnYOzeLOgbwEnnGijIU+VJyHjt4LgZ4fu/rvJW63Y3wiAnIjdCiqIB2Vjek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRhKhl9DZl8YKdB/aguf0sa2EHDx8+totcV3RWYhSaY1Ht9XB
	t5rR7VEvkzKIal3mSoFa8jY5DeAi5ogkObJ7TqusNVonfbVU4BFkUpQpnwpWS5J8xtdYKnSCNNO
	AfHv7HiXUgTfYsL7a1JvfDh68r/7TWEc=
X-Gm-Gg: AeBDiet9SDufMggxqdtMB3Evx2y4ytx3X5mcK3udhTXCiazIkAxF6G20zQ6wQaRh/nM
	7LghTkQq3BmckQPKuIgvkLghG8qG33pO6xRzJvcpz9rACwYhMopXo09Ot9RVUe71IbQAtd+8bTw
	3Aii5N43UaoqaqsboEmdHnk0+lVeNfD6cE+1Q0ucU0ulPjeveDvocC26hXCOcDnTLU+9AFlJsZz
	bAMVLKUaQzpGsy6IArB6NvWFsvCVavDkF2WjH2rhYAdxuB3JTCsVuzdOxGtlpIHCJ+iPyq6Trs+
	vTRUC3ncF2HXkpb5H5ZLahqCx6sL9Qtu/kzhEvI=
X-Received: by 2002:a05:6000:1ac5:b0:43b:3d02:7806 with SMTP id
 ffacd0b85a97d-43d642c852cmr27633427f8f.28.1776187972920; Tue, 14 Apr 2026
 10:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <CAMgjq7AiUr_Ntj51qoqvV+=XbEATjr7S4MH+rgD32T5pHfF7mg@mail.gmail.com>
 <CAKEwX=PBjMVfMvKkNfqbgiw7o10NFyZBSB62ODzsqogv-WDYKQ@mail.gmail.com>
 <CAMgjq7AzySv801qDxfc8mEkEsFDv4P=_qw0rNOTe0n+qy7Fz6A@mail.gmail.com>
 <CAKEwX=P4syV38jAVCWq198r2OHXXc=xA-fx1dk6+qYef6yzxWQ@mail.gmail.com> <CAKEwX=NrUhUrAFx+8BYJEfaVKpCm-H9JhBzYSrqOQb-NW7QRug@mail.gmail.com>
In-Reply-To: <CAKEwX=NrUhUrAFx+8BYJEfaVKpCm-H9JhBzYSrqOQb-NW7QRug@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 14 Apr 2026 10:32:40 -0700
X-Gm-Features: AQROBzCXAeCqcScOKrvPHFEfL-AEpSgsJNqZGDJveRabXpX0aHvntrnXQgowKrw
Message-ID: <CAKEwX=O4VJzHGqJFnXOyUhamr5-hckrd+C=V8+f-Lz_HNtaJ_A@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Kairui Song <ryncsn@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 10:23=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> * I still think there's a good chance we can *significantly* close the
> gap overall between a design with virtual swap and a design without.
> It's a bit premature to commit to a vswap-optional route (which to be
> completely honest I'm still not confident is possible to satisfy all
> of our requirements).

And to further note - these benchmark measure, in effect, purely swap
overhead. In a production environment with a lot of non-swap work, as
long as the gap is close enough I think we would be fine, even for a
hostile case like a fast swapfile-backend (I assume SSD swap's
bottleneck will be the IO mostly).

I will stare at your responses to see if there is other benchmark I
can play with, but it would be very helpful if you can share your full
suite :)
