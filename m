Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B8303A2D
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760132587; cv=none; b=aACGPsqqAkxRwUdrfuzfRxps66drkhIuKB10K7tfam/of8aChaRvBCXzuqH9zW/grzNW+fGa508VDTH/vUjzHXdKZNtZz2pAJYlw3yrfeqF25cJJvwyiemeq6fYhZZGUQFuTK4XulKUtfm7Zmre7THM3aiwBJ/K14Bhjxeo+fHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760132587; c=relaxed/simple;
	bh=fwjcVIiQrqDfhLwRQIz7WRB+b/8kgGHlcJpHFwbz7Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aw8hRqH4URJaoH+sAYOTQXkJoBW0ljm9Wrnx2xt3CcFDPJ6MAP3uchm8AKdkFnAUNJOqONJdvksdvmVLk0B3rrSHtQeirCGK3gWxNjDBXWeNNTGt6hTOHhfW8aCPk0iOkGOogWTZsq0sSWawVw0wU9K2fPlngYQrJvub5LWzBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hrs+fymx; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hrs+fymx"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-42f8e736ecaso175475ab.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760132585; x=1760737385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTEdXIM9TCGjTEQmnu4q5KwtmIgjop26pFrSD5vSjaM=;
        b=Hrs+fymxA1ax0L/3DkBlgZdq6Y+stH6GEYaxf1if1c1ZwFFqH9JjdTgP9Bd3QSR6lr
         sAZcRQlRmQIsjz/Aor0xJHN/RofrOnF9utufRxb5Mulo8qFzQ4BWPh8+rk6twYYotY66
         zttljJjUkVU7T4OzlB2inCcJ/frOvM+CtxGpACv0A8uYbBR8n6yJYS8SmyP9St9Gr8Ch
         78Cjklied+CaueJ5iXuCt5l66sJj/9NcpEcj7TERVEg0v80punhmtDjJMQPLj2DlAicj
         XWiOLdBezXwHfL0Av7BTtwlY0e6gvuj7mEs3iXbJkmYL1LuyfTZdzk+Gx8K3ECF5mYKp
         U63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760132585; x=1760737385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTEdXIM9TCGjTEQmnu4q5KwtmIgjop26pFrSD5vSjaM=;
        b=ujRkin6ORFe0c+DFP3PjcccMnapa3TyT8wfNchwbScu4f7vMS/4noAAqneWuy9u6TS
         LuY4rCycmoDbRZ6fLLba7EpMcvP15vpsCPrakrTezJ/VE2BVWv7PbOcSQThVL8UlBeF6
         UX5Qop/ONL2mBJ/eyoj87FxyM+9nTTUUNMEpJW9hRI3G7KpQcoYGTvm4H0rer0HhUXb+
         X6onfBSB0M2WBb0sgyzPV4d/0AhaCunI7iNTwFezrR77r24bi1Vo2kmG/8bqWdss8yEt
         V/lds+e4fn8St0Q5UcdGE49hktjAEs8RXi9/+pfhF0DsE2GCjhPf6Wt9iIYj0As69kWc
         BRSw==
X-Forwarded-Encrypted: i=1; AJvYcCXetqU7zBckoH6DN4zXXYTpNBNH/rDxYHOWUslagnyC8uQRtga6jhvrszmv9EdCS+H688Ksk/1Ereo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAj0BPY3bjLDMmuspJoLNdJWoNHtKEkQx1OdAxC3HyyMXT988b
	iDZZeWJR/fDj/wzEytySHb/zP6MB1Z2sERLbNLx9W+cnknIN7cpM8u1UZ/ddNFH6BaoGJOkD/pk
	7ObV4ZtpANmdXhGBzyuD9x8ISGK8e+U9bnTxd/bKk
X-Gm-Gg: ASbGncuVCGSTx5/l1nyuhxLKpoSbGhuoRhITWD+cpAADT5UPDO7sammzR9oK7sk93uj
	B8kyMMPVTPkgACUf+x9+xvdNYO+zhywbfqbCgyDffPrKPpYJVDsYLTr5IZJE4T/C1OlDxpgIXSa
	HNV7Geer8JvFRLVzZ1QDyzm2IgnWFizi3ys5lDEDgFZ4Q+jcNkOMGvlZnolUTO/zwnOkv2B1VQa
	zxTJ1be3a1AOtJcCXhWdHRCTPmiCvjetg8zBtaGHw==
X-Google-Smtp-Source: AGHT+IFYO/m3ZokqgLgfZFSBuJ8vQyfm/3HMocIoflB016BCepHu8r9v6klK4bxjJEyMNFam7jZJfb7DI/PhTm+ebno=
X-Received: by 2002:a05:622a:348:b0:4b7:a274:d54b with SMTP id
 d75a77b69052e-4e6eac0ca05mr25279901cf.12.1760132584434; Fri, 10 Oct 2025
 14:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010011951.2136980-2-surenb@google.com> <202510110501.92Srmvgx-lkp@intel.com>
In-Reply-To: <202510110501.92Srmvgx-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Oct 2025 14:42:53 -0700
X-Gm-Features: AS18NWCwzOb_Fs69JrpmWw3AQRynK9NMKzj3B1QDKKaakj7u0qI0Eoy3eq_sHTw
Message-ID: <CAJuCfpEa2rdLuu81SJ807M1vuGd1eY4GMO2CrrfU8gY=VRtPcA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: implement cleancache
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	hch@infradead.org, jack@suse.cz, willy@infradead.org, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, hannes@cmpxchg.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, minchan@kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 2:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 70478cb9da6fc4e7b987219173ba1681d5f7dd3d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-implement-cleancache/20251010-134501
> base:   70478cb9da6fc4e7b987219173ba1681d5f7dd3d
> patch link:    https://lore.kernel.org/r/20251010011951.2136980-2-surenb%=
40google.com
> patch subject: [PATCH 1/8] mm: implement cleancache
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/2=
0251011/202510110501.92Srmvgx-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251011/202510110501.92Srmvgx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510110501.92Srmvgx-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/cleancache.c:119:13: error: casting from randomized structure point=
er type 'struct address_space *' to 'struct cleancache_inode *'
>      119 |         *ccinode =3D (struct cleancache_inode *)folio->mapping=
;
>          |                    ^
>    1 error generated.

Matthew's suggestion to use unions for members with multiple uses will
remove the need for typecasting and should solve this issue.

>
>
> vim +119 mm/cleancache.c
>
>    113
>    114  static void folio_attachment(struct folio *folio, struct cleancac=
he_inode **ccinode,
>    115                               unsigned long *offset)
>    116  {
>    117          lockdep_assert_held(&(folio_pool(folio)->lock));
>    118
>  > 119          *ccinode =3D (struct cleancache_inode *)folio->mapping;
>    120          *offset =3D folio->index;
>    121  }
>    122
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
