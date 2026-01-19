Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F837BE81
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832728; cv=pass; b=fE3Mjlg8CA2CZJFvzwa/ZlGNgx2A+JR6KVc6waVWUy9Ce13f7qU4+RsCqpeSeBwq1H7NKy7EyqujihlaiJHQqj43vCUhuwz0Jv/78Cvf/fSsOAjj+DQ0SkE+pRgGxBKnvx/00P9qXJt+4TDe19EzbPIilav4EHEg7MdmxqGTT5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832728; c=relaxed/simple;
	bh=yWfpM57Ov0hDYx5aY7CnSscsAijAfja4kjPeN0VMSfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuIivJv7v1bJR+TBQqJ+cXuPXysysIuHaGWLl9vGmQkTjKXW6DvAqUFivPTwApeIxO6a5JoVH+ctyF5d8Ew0rOgmiW4XhIwkEV5p1IaOr8R1C/8gghr5j9i7SztQ7YrXNG0JcJYOz6w/rRWt0LQYyzw2sM0xEmXhAlbWcDAo0L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f9vbwFAf; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f9vbwFAf"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d147ce4so11120a12.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 06:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768832725; cv=none;
        d=google.com; s=arc-20240605;
        b=c92b2G6bm0mzTKN7amJ5VMhcp4ZBZhuI39A0yiA8snLzkl1q8PgA2l4g3j74cox/B8
         vA+BIMtE+o3EWcd4g9MY1JH9R9q3cIxp383A/5QokNsXzaXh0SB7WQUcKu/utxwX24VG
         jP0161xvi0zwNbswZSQkcEogN3LH1bPJ/PL8rGqNIPj1CBAvcgTaYj4aLQYJoN0gVjIO
         y2pw7R/llcWZow9s9vnrVnBhClIZuLLj0B1zF4O5xC4nV22cyBc/2k4o/mC1sOhUNd+v
         Bv7usGwcOpgiyf2YrIdNfEhiwM0QdBdGodgwICIwaTpibJ07TsoHDdulDDCVQoFQkIdt
         GADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yWfpM57Ov0hDYx5aY7CnSscsAijAfja4kjPeN0VMSfk=;
        fh=6kzXbLSKLd1XpfTbExZzRF/eREQ8JzBU5GYttgbV37M=;
        b=d49j6RPeYScFClEykgnRZY7zgVd0Rm8PsQhhpAHYQGBeydVmUBev0MvovvPnuLQjhW
         nlPp7uUn+8pPFBV+V6CvGRQ6oNRml2XmQX1QSpwZWsK2X9P0KO4Zb4+fEV8HKvXu9/xV
         JuZt0+80z3rbQLeBiRByN2ijhJxNjhIQom2bRJhM58qoXoxOUpAb4Eu9UbXAHJZPpNKo
         2J2g8qdeaxJn/bvnvZ4B6+drD1bFEZX0mPPJahMXuuPN/HUOl2up/JJWxGkrCi6CRNlQ
         khotfAgTlklxISdEiEFEyBstDsdJDmKQz/ssnrSfbzYzypXeEvuIVZa6nTEdJEmTO4WV
         zPPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768832725; x=1769437525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWfpM57Ov0hDYx5aY7CnSscsAijAfja4kjPeN0VMSfk=;
        b=f9vbwFAfi3MxgC50GvHv3PPEUNS7knePmO/YuVWCJrAO45RgmcG3TojzDY4fjvbzHm
         Y2vR3/zSwNwb+cI1qo+P+i9K96KqMesDM0bpvT0kiz3QbYPE2AnQ+waYN7tkCwPr0mwg
         FWBcuYWLrN0kAQhcgCxnvWgjO/CtFZ8UlZQEuxJJ0hnQNBJCGtX7ZMp4x7AgP3vYjfov
         5Xs3BSgv9/7t3Yf558bnTIO/c4emE3MBXpd6uF2VoLWOgwSNksZVHJLpPM3m/gmp/N9h
         CqQVj3g+4KwS59XCTy4kQwiZ7KNCmAf+DpwTOmGUC0vzry+37BIhQ/qwcZdpVhXTyCO6
         7fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832725; x=1769437525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWfpM57Ov0hDYx5aY7CnSscsAijAfja4kjPeN0VMSfk=;
        b=MbAqWW4snTrCMBeJKiXQMayln8ybnYxMU1IA78oWOjiEH5KM4buHj8nh0aIVQyq+LY
         oW7M3pUAd/OELDwnlj8iPvv2glfWTdRzt+qgUhsGNdwLHM0vPZ3+b80NdKRwH888z+zX
         PosZ+pfxWnVwOUgBGnE9TFdd7kqyxovyKLNxvTv90BPJNLunH7qfxc5OawkkaG4rCczC
         jxIf5NvtmqWOVoX3aJsA/kmliWxh2LOh+V8ySJ5nZmDa+P/udJkma3uBQTEpx3MmU1bk
         8dz8sB9qS2itVq//9vCIZ+EM9lqEL7hS6nTeTuSMhwGue/dyxmITrbY2ZvbcjO+ysvA1
         SCIw==
X-Forwarded-Encrypted: i=1; AJvYcCWURx2B6xgElMMxAmcvxZezra3A/DKAcLaSrxjJaSwb8rme5V11vTFMObXDE7ok2aldLb2Q3fKiUwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzNbogNW+l6uWO/5oRmdmf3b88l1h6ql8GyUqxjsiPBBMblrX
	xBI/nnA9A3J8IsaAUYml6XvEnhDR+siXkKUrZoAUSbl6lUrNaC2w7zOhPKkT9/exfGitCpPNxXk
	96ODGPvSuwJ7U4CzvEf2V7QegcIVP/f7FtTGTuQvJ
X-Gm-Gg: AZuq6aK8SX4XU18XYKoYDteE1v413ViEw1JJOoew++UUNWT30bKCe1fMT9/cLjTASmP
	NX7tJLqdsOgQpqWBdYZRjv1/l+zQYsh3YydDr9WEWCgzAcXQoS/ZXqNRAMrisVu0VcbAxWMYpdz
	Caen7vqnN7n2PSy+h1ikFfEN9N421TVnVc7zMgZs5AWce41mY6smq+39m2esK7WcsomrS8XX0bY
	HX6Xs85+bzji60vh6ILe7WbJMdgEfQA/jsqTeuwJlC3TIXPIll9nBdkaV4NxwmbXh2av1g=
X-Received: by 2002:aa7:d914:0:b0:645:21c1:97e1 with SMTP id
 4fb4d7f45d1cf-6560b37891fmr63399a12.18.1768832724914; Mon, 19 Jan 2026
 06:25:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114164322.787125-1-smostafa@google.com> <f3ab0156-3d7c-470d-9c1e-922195ea27af@linux.intel.com>
 <CAFgf54rVPaUgbouXWQkczCyFQvXkrei_x6FYY6n1X5NkSSwYfA@mail.gmail.com> <aWos4aIxKpqWuHoK@willie-the-truck>
In-Reply-To: <aWos4aIxKpqWuHoK@willie-the-truck>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 19 Jan 2026 14:25:11 +0000
X-Gm-Features: AZwV_QgGzbNYGrxymBlNJ_B6_tKEdbujc-QXDCatHQBzV6r02BmVWWZUnnYdT0I
Message-ID: <CAFgf54r+RW0ot2Pmv6z6yvb90ADheWeRkxDsa503vOw7nXpZQQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
To: Will Deacon <will@kernel.org>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	joro@8bytes.org, robin.murphy@arm.com, akpm@linux-foundation.org, 
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 12:19=E2=80=AFPM Will Deacon <will@kernel.org> wrot=
e:
>
> On Fri, Jan 16, 2026 at 09:08:42AM +0000, Mostafa Saleh wrote:
> > Sorry I was travelling all day yesterday. I see Jorg hasn't done the
> > pull request yet, so I was hoping we can still change it.
> > But I can send the fix separately also.
>
> iommu/core is a stable (non-rebasing) branch, so patches on top, please.
>

I see, I posted the fix separately in:
https://lore.kernel.org/linux-iommu/20260119142246.3821052-1-smostafa@googl=
e.com/

Thanks,
Mostafa

> Will
