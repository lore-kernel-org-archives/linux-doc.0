Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383D51EE09
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756752; cv=pass; b=j1dcDxnXMRR6JYRSy8UXDn/j3NLm41uKaKEA32UYMkpf8wjTeCGPr9ODHwOev93wT5AIIf7kHJEoPZZDYgpuFXjwxeNWre6nba0YdK0e2YgBk8XsKou2yLqVoFsrTUXdiANYFf1ACXRD/RuiV97l5pwWNb/7rzuvI0GzqeT7Ci0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756752; c=relaxed/simple;
	bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kys4MCLIk11jDF1VnqGz3JqmKp2PSA19FsOo+KaX8mY3CAYz5A1Z6wmH+KcSt/0NHLSHclJ5rI/Jl+SOnM3XNfQPSJyl3xyoOA6luLKro4qhcMni+VTxi9qJJNdx036RNkSKQVX30z290k62MYdzV7sPAphHF6ZaW0dXeSIsTh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obNnlZLY; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obNnlZLY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so10638285e9.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 11:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756742; cv=none;
        d=google.com; s=arc-20260327;
        b=TXa6/mZNqm6QCFJYnawZFekfVXtOoFHKKVTXWQSCw9kUnNAzS6PIXFqdeJN4wwA65g
         kpJ8Fd9Omx31ZZwwSFfa7CSp4yUQNXcUquHiO4PAAJ4m8WFc5K2Zr8EoXmRXbVVk2JGV
         clOTfT1rKFzgM7f4zoqWV6xAl/jYfoliAKhYEpbeprjH2Gl7rBJcUKot2IZG5qppLkkJ
         IO+qpMmT5D2tQ3HsxxQCnX85/RDXd35/dR3EqC6ILkMxBzA5UHzGO/jrZqfvsooIyEiy
         RA1mGQWo2tHWVEoyqlarAoV0y0qdSG0JJrUETEIKpWpd1HWGqx/Q9NhTDt+MN8vQaLJB
         DDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
        fh=lI8qnQawVC0NTzyoaxnP5swhGEVXWKk2Zr/GRlsT1Xw=;
        b=WEgP9s9EC20mU6c4bQIVnUqwXQc14jUQguYwpz1LO6uSt1eq62Loja11YsUYZlwJQn
         NgOfhxWhfBjyyMLN6ip44Sd2CigicgFYoLA9Yw3/ARTCodS2kyelhw6cZ1gPilVTjt1Z
         R2plAb7Py5O4CJqd3Mc4/QfuxABiZWz+MLYAwbxraufcfkZIDfqNAoi8nvYxOJeFzEjE
         VA78WqVfA/U/HcDV+wfP5cfkmkkc3BlEBK2MctE1zNa30P2dXqMJKsbiWxL1K7lMJUYf
         W5PkW90Ucj1tK/RN/6tNpFL1l12Ufbo7yZrV3yD/VfRELC0s4oNX/FB7HeX7BnlG0kS2
         VlBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756742; x=1790361542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
        b=obNnlZLYFJzew1YQyEBNBo+9UTNHWK5MkuSuP2SqOmDg+26iuoZGFb3EykwWF5tdu4
         0pClMybpon2TygWZD8dORAxN9WaHCYsehi9QZkV0Btnw4QQIMoeqyHX+jCuLOq5lYppq
         LI+Dwlzw+zhoakhNUFHqaSjIlv99xjSbre3bBvnCrcjUW3mrAvxaJ9xEpaRantOaj2Ic
         QNoi7t1PHOKesq7p6xit6jlISLxbLSU1iRCaTXAj80G4Mf3noff87p8eKaTrx6WjFebo
         tAnGA3SOv0ZnnA8KXQ3uYfeO9EqvplfbHqxDwi8bZ96TDck0KfYnC649OwJOQEmGgQie
         8obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756742; x=1790361542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
        b=Kgn7BJR1yGogVTmUWSkMPrcJXfxVwjZoaixzwvI5DWHlcVQ76RZ/fO8RPoDXF9kuS/
         +PVo1i9F6JFHxta7hChGGA54u4lCJAM0IAc2Lxk02H9mi7x4UcP5KaK+YOv9v20xLu73
         Ju+ctkGgm1dkabHYK3eEXgImVpjQ3qLa+guvwgdw22aVsaa35+8ToJLRX3yUFH4inuSE
         UjMPz2e3IfZ2nBSOs0Nd9oFz3B/1ae9jKQyWKSt9YFyuP/11l5M8cB4UtP8tzvYJlYAm
         80Qfa50qO+V9l7A7o79u9S0dtQVF+v28UuqlUDF5EmZmJdPCodCFVUMCDrASTqmMU26z
         DhVQ==
X-Forwarded-Encrypted: i=1; AKwUvByDkS+oL+G4MxZt1FPA7poaeRbeqMdnIqrj+VNUfmgKnWxnFiu98HN9BfOKuq2pddAbE7CuC3X1agA=@vger.kernel.org
X-Gm-Message-State: AFuF++mh8ABjdSzrmTJPObvbqhWTw/G2hI2nZ4hrDPcmGsRF2r9GXRbA
	hq8oCfZS8VE26FXKpzTaI4H9sWmJssEPtvSktOGx6V0ORH0kP2VBNCoK+z7hDvim/ySPoVTuGD6
	0oAEY1dAU4jqncvkfhw9FH8n7bC93nIg=
X-Gm-Gg: AYBFou1jOBt1i+gNW5HRn9B14GRC0tnXikKpy5o/wX67eeDoe/DG7/9ymupKODzYSVL
	ftHAA/19yUX60J6Asja7+9yiz+KVPvSxmvz+IknwqV8Wj2GuXE4pwqoeyMie9qMPQljqJnh4eLE
	joS+00I8XE6CzP/Bl3qBgYx1j1aXlA8kvt5khFlcLDOsbH6NnnTj5JeBKZokZ+JDq5YQaxfwBnC
	9ulKkFB4p2gICqaofO1UatC0Y76dgdvPSkcjqX3dKqIJazh3hrgtJsxhvgrFdnBlIKvgbbWE9B4
	QvZdLI40oXydl9V1rfd4tdVzt3vik2TKG/Nti5uHiV39ZT6bq0qrn4L2n0LtnLbxUj/6O4zvDTC
	oMdo3owX38a8=
X-Received: by 2002:a05:600c:3f07:b0:49c:ee01:8c53 with SMTP id
 5b1f17b1804b1-49fc56713c5mr46641755e9.2.1789756742167; Fri, 18 Sep 2026
 11:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com>
In-Reply-To: <20260918180241.3424851-1-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 18 Sep 2026 11:38:50 -0700
X-Gm-Features: AcwNN1Wvf5cok67nfOV01MjLnEAhXsQL9tKGdT3-XrD1J_-pQ2FeWcoNTuL8dyQ
Message-ID: <CAKEwX=MO7JjfTQU4NP_L6Uepk_WL0jYBKEB1woK-8brvQqCT=g@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Virtual Swap Space (Swap Table Edition)
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:02=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> Patch 11 is an RFC. It swaps vswap's cluster xarray for the VM_SPARSE
> vmalloc array Baoquan He designed for xswap, to show that the data
> structure and the device model are separable: moving to his is one
> self-contained patch that adds no userspace interface. Note that
> per Baoquan's commentary (see [5]), I have skipped shrink for now, only
> freeing vtable when the cluster becomes free to minimize metadata
> overhead while keeping the skeleton in the free list. I have not done
> performance testing on this patch yet (the number is from the old design)=
,
> but I have run a suite of simple stress tests.
>
> It is adapted almost entirely from Baoquan's code (see [6]), so I have
> kept Baoquan's Co-developed-by and Signed-off-by tag.

To clarify a bit on the motivation of this exercise: Kairui and
Baoquan raised the concerns (for e.g in [1]) that if we were to go
with the xarray as a data structure first, switching it to the
VM_SPARSE vmalloc array would be difficult. I want to check this claim
by prototyping such a conversion. It is fairly straightforward and
simple to me. So it is not a valid concern to block the landing of
vswap.

If we are to actually switch to such a data structure, Baoquan should
be the one driving this, by showing that there are performance wins to
the switch :) It is his proposal, so the onus is on him to drive it to
completion. I'm happy to assist with the reviewing and testing!

[1]: https://lore.kernel.org/all/CAMgjq7AHRzBsbmGOx0s=3DTQFBwcn=3DDEU1naR44=
3sO6x+pJd6hAg@mail.gmail.com/
