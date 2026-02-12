Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084E2C234A
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904821; cv=pass; b=jsHYThEsNUykeFV0nQd9wxaGZOZeRHNmd/RM154ap+PU8BjQDPnIcu4tWyTufIcfcXNhxT4O53v1JSEcMwaTo3HJWDW3fycgsKwhsB423VXS/BjVDaKX8Fz4PDXDVDhXOiODvgRNo7UtAMaCMruD39kUglbQEVx84W3Pahf6Auc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904821; c=relaxed/simple;
	bh=5So+AYlnYBUG8P833D7MIJ51WXhXlMTuvQnknuIF3Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSagzu7FZ4MBXL7DALzks3GC5fhJC7eSahPYM9VJjywwo1RJ5ahtIwhfs8SiiweGSub8azd3fttpbz02gKDcFginN78bThWSGlKvn+YKp6xrnC5tY+Jnb3nYfw9t0oiGehMigGRqIKR7XeqS8T+7MbZRmD7lbHG0RW7euU69BUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dgd5EN7P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pKMFrLBR; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dgd5EN7P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pKMFrLBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770904817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
	b=Dgd5EN7PSphaoxCFK59BorPwGi0fxfu+z4c/rQCtwE7TfzVTfIwFDpcVQ401Xi+cQRoK8P
	1EqTJByiHckw6y/+g0XgdgoJ9prgZftXzkFUq1WFtGiUIJB51vQQ4QWArryfurVyBjBlUX
	Pi8kswWFAHnGEhdkNew8FDe3/L7AVTo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-_FQiODiWPx-mDP-2trKi2A-1; Thu, 12 Feb 2026 09:00:16 -0500
X-MC-Unique: _FQiODiWPx-mDP-2trKi2A-1
X-Mimecast-MFC-AGG-ID: _FQiODiWPx-mDP-2trKi2A_1770904816
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506a1ce5d31so1365881cf.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 06:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770904816; cv=none;
        d=google.com; s=arc-20240605;
        b=RYWteryhfL8dKTkz9YDnB6sdVUr/5fMUv39875PRGdvjpLMjo1RdE7XOgyZYMfhK+a
         ktUAujzYqNnDCJ6FtOdHtnfdMibWUpe8IRNenzbQO75FJ4XEzyolxSYFwX4A0Tij249z
         EcnKMwD8v8J1no7s+dKGEl0U7+MPDhNRPz8tK2ksOxCZ6TR7+z+SRUF28hRBvqXK/UHc
         MhEE6fg/FtSNeHPmFSIigrbtwrSN9hMM9mp332Vs69RiBPW3IGPeOGINEYwqzasYqAPI
         fu4tSKNqlGEXioEiUm4rF6/N+ojBH0mkuiccUdrKOu5A5sjW1O+sG4UlikLn82tY7UQn
         NPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
        fh=jaVqxVpndP5ENlE+0wBSIg7R/k1Oh++aAbMSW6NHK38=;
        b=idP2AkMRtIbudqJi/eGt+BmR8p0Rjd1EDlpeeTtpSMvFJyXl/CVQ/NvPSDSM3hx5X8
         HQKOtpSD2UnzY+a8C5f9+vOr2l3+Dq1XC97dqL9VTehZMreOzrMfdEwExGCDBXkt5ZLz
         H+o+CbBdUnhC30PDzk9kI1UJVH18YarTWHRKUJiYAAH4FbvpHAhmZwlqrGcmbg3nMu9u
         0hgumXL06DSaiT17QHhsFpc0TxMnLleRpekkPaiGc2DiR1VqwbUeV9smBYGsR2iLtGLg
         PYfxVnkA+FYDWX0kpCtkQTJyPchvjIRhsfp657Gn/AWQ2mLcAAJajPTpq+89wiGIWmTV
         RLJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770904816; x=1771509616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
        b=pKMFrLBRPjpERF5RzQTv35LRHOlJwWFvtearKzZ6oUSz2KTvmVy7JT7Ydg+CWWTW6u
         SPf0tg3ivRcS2jJ5msEQfYrSnpQlbdZJqwZEseN8P5LQBdFZFLssJsHGiCZJAhk0epUh
         CbR4XNUt1kNESYqo4PwbxgO/Hqx3ezXkgat6I1L397qb3/5S9FDDX4muCvJt0fBmj9k2
         Bi+Vw51zfIqeDDOOINLnm6xmBs+KheV5rDKSCRowv+O/ACrt0ENtOyUEL+FsCAVsVT95
         a+hCjjfqDuJcKsyjP5KYnmsiqmWMvXBqcKFE3tSRNhYY79uG0dvqzQ8ZApludjeJuJps
         ReHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904816; x=1771509616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6fqDi3KyffDsVgAKVUvyPTS3GAkTlVPCfSZBYkz2v2U=;
        b=Cfp2zvB9KRCVvGRQyuM5dmcl0UEbpKMbqMGXRfJFFkU4fcOjY35J/iDGFAcWB4P8/m
         1Yqy/P0CRoltDwv4YiUdVCFp91boHhFayIlI4ugeN/NfoAdi6Yzr8rqU+LPnUcgvOy8V
         WI89TUolXu32prjja1ru4SgupnFW97twgEF28ISxzeW0+fRoY0j72Qaer5ZTLqTD+KDP
         mvHAV2qbqOatAR7YGJhYNHB02zrSGBOdjTHPupnhIp4WdQgKSyxyvmMJQbV/qqYAPCdf
         jTPRwbp3T3xSFZzja6LD0I1yWgUGOZtwXDVlOupV9bo2HghqsgqMpdq99muUU54T03EH
         Tstg==
X-Forwarded-Encrypted: i=1; AJvYcCUUijTi9GLoIu8H1KCsL2rAoQwJVVwgYe5s6PPv84eaFUNm/60rKHJatbW0fcXYua1M9hfy6S8nE/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8a60ScCmw8LB8cu+VbC9LjYPCv2W+uECL6acRkVOXipKvqoRK
	daDRvrgO+/1B4+hv89CkvdJTauDBEas60QvBomgKN/1QHJpRkt/F/fznZmLuNFmgHU/JQVUQHkc
	N3iC3OQwU8Zau/sh2T5j1kEizOK5HRpB0rKGizQz3Sov4vFxos/wa/Au1LdKGqBtb7g2uzI7Ib0
	TRaHWJ8TBk6563KYDdLYCsl3rHpMJZssx2xrnZ
X-Gm-Gg: AZuq6aK4lN5NdOAgrSn63IBbSrfcUnmWBKYGF9uZHpA1Or+AqUwjOxHfH4Vz0Opz22A
	QBMj9CG6i9YxJXnNH/aEkU2ALcfxuw1cjfCaS/JXvxqXnpTq+6FC+PqRak9Y0TUd4XFU9HfLe3t
	vs1s8O94d6mJCv+94Opa9WQeniVDigkT1KUW0drtyXxv3Ia5bEwK5Rlo+NmaEq+hw61FOjnEJFp
	NjdEZhhGfN9ZjrQbSXtugnbjVrClhVUFHC3WeI=
X-Received: by 2002:a05:622a:4d2:b0:506:217e:b0e5 with SMTP id d75a77b69052e-5069471b3bdmr22134591cf.0.1770904815503;
        Thu, 12 Feb 2026 06:00:15 -0800 (PST)
X-Received: by 2002:a05:622a:4d2:b0:506:217e:b0e5 with SMTP id
 d75a77b69052e-5069471b3bdmr22132021cf.0.1770904813375; Thu, 12 Feb 2026
 06:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212124923.222484-1-gpaoloni@redhat.com> <20260212124923.222484-2-gpaoloni@redhat.com>
 <2026021221-grading-clatter-b7bf@gregkh>
In-Reply-To: <2026021221-grading-clatter-b7bf@gregkh>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Thu, 12 Feb 2026 15:00:01 +0100
X-Gm-Features: AZwV_QjUUvlcQ1gY_oM6dV3H03_w17i2jymN17xZ8bDIyjGg9gzhLqYbN4-NK1k
Message-ID: <CA+wEVJaFX4AE5ruKLvgYZhmNsOabovLp=2LAaLUYe5B9r51qEA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/6] Documentation: extend the 'Function
 documentation' with expected behavior and constraints of use
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de, 
	brendan.higgins@linux.dev, raemoar63@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, acarminati@nvidia.com, linux-mm@kvack.org, 
	safety-architecture@lists.elisa.tech, kstewart@linuxfoundation.org, 
	chuckwolber@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

thanks for the quick response

On Thu, Feb 12, 2026 at 1:59=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Feb 12, 2026 at 01:49:18PM +0100, Gabriele Paoloni wrote:
> > Extend the longer description section of a function kernel-doc
> > header with an itemised list of function's behaviors and
> > constraints of use.
> > These are useful to link and trace test cases (e.g. KUnit) to
> > the different behavior IDs and define the constraints to be
> > met by the function's caller.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
> >  Documentation/doc-guide/kernel-doc.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc=
-guide/kernel-doc.rst
> > index 8d2c09fb36e4..23e6c4b45b14 100644
> > --- a/Documentation/doc-guide/kernel-doc.rst
> > +++ b/Documentation/doc-guide/kernel-doc.rst
> > @@ -83,6 +83,25 @@ The general format of a function and function-like m=
acro kernel-doc comment is::
> >     *
> >     * The longer description may have multiple paragraphs.
> >     *
> > +   * When specifying testable code behaviour the longer description mu=
st contain
> > +   * a paragraph formatted as follows:
> > +   *
> > +   * function_name behavior:
> > +   * [ID1] - [expected behavior]
> > +   *
> > +   * [ID2] - [expected behavior]
> > +   *
> > +   * [...]
> > +   *
> > +   * [IDn] - [expected behavior]
> > +   *
> > +   * function_name constraints of use:
> > +   * [ID1] - [constraint to be met by the caller]
> > +   *
> > +   * [ID2] - [constraint to be met by the caller]
> > +   *
> > +   * [IDn] - [constraint to be met by the caller]
>
> So the same "id" is used for a behavior, AND a constraint?

The idea is to have a specific behaviour or constraint of use
identified by the tuple [function_name behavior][ID].
So I think we could have a problem for duplicated symbols (but
it is a sort of corner case...)

>
> And what defines an "id"?  I see in your example you use number.number,
> but is that specified?

I thought that there is no need to specify an ID format as long as the ID i=
s
unique and referenced by the kunit tests testing the symbol.
Basically I thought that in some cases it is easier to enumerate 1, 2, 3,
whereas in others a, b, c can be used or even a mix 1a, 1b, 2a, 2b etc.
So I wanted to leave such freedom to the programmer.

>
> And how is a id going to stay in sync across different files?  That
> feels impossible to maintain for any length of time, and puts a burden
> on the developer who wishes to add/remove a test or "id", AND a
> maintainer who has to remember to go and look in multiple places for
> such an id sync up.

Well given that the tested ids are defined by the tuples mentioned above,
the relation between a kunit test and the tested tuples should be not
ambiguous.
Also I thought that, when writing a kunit test, the tester should know whic=
h
behavior is being tested and hence it should be easy to define the tested
tuples in the kunit header.
So I do not see much of a burden, but maybe I am missing something here...

Gab

>
> That's just not going to work, sorry.
>
> greg k-h
>

