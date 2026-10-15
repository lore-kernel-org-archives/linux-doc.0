Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E74BD360
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061896; cv=pass; b=GfRx8MaBT6EGKbCxO2V/YIR8ztYUTLpPoX3v+zqwSRoK7KRVN2YnMLzXTe8EXJTtruzD0BNCV4WfGtchAUBWR4Hr8J6ZAwZYl+97Rbg23ADY2iUG3Fdp1/fC/l2ITBiJOBZASQFLUvTM1LEyuQ+BGhs17kUvx2e6cwCP3DozIvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061896; c=relaxed/simple;
	bh=dBzpmy8vAejkYOF1UvEIQD8nY1REhPrwkw4TQQVn/0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCcRulpvzcJNCx+lFtadmPYOZiZ9gInunyuscHduBfAPT8Rn5JXQuIEwVSN3f+1Y72s7ML38kSWIZl4sCfUUMlKnM3vaBz9Ftod52pFpgYIJvMKq3xklxL6BrVnbYBa+AhmKai6+vlGfeGVDcbGCIrK5segOT9lae4tdkEUmWe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmGRrYiU; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmGRrYiU"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93a40a9a01aso260957285a.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 03:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061894; cv=none;
        d=google.com; s=arc-20260327;
        b=SVzBoNTbnqXoSZEJk8OURFNqphofwOPOnIsPQ2Uauoso2c2vccoWXcJnQZbJULMCjM
         aVL9kfa3M2Cd9s8jwg6mtEleEJZ/HSj3McOWGLdIpstaUfmcjlyER8qLEtk0B8/2MjNV
         VtSziLQ+UdaSKddgCfEwcrLpToYl36mqlu5PnPjRC40/eLRaMC6aOJK+NZNO0ZpZ847k
         e9PFBncCwDjDV+acd7ENeG2JYF8LNGPE9deWNlcUSVWWmWD8HNOfWkvbZcvZrw5vWK5A
         pBd6jKYGe+/UfMR6CimDLmSRdiBkNnFzndCSZIrjbhCdThRba0vYluhYnrezfTStmklT
         pATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GLbZq4oFla9HIu9dh56ABciRqX8LjjTHmE7ItkbBnWM=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=njYtkDCN3Qc/cIjwSErRXIUChSKsXesbgh/Lhxb5miSJZKnbqpIJtT7aWdfSxlfpvy
         m3fi7g1+dapGpGCHRrPsiXTL5u966wt5lDrYIHpdGcvsGATpQeqWeyE+zFR74zqMBSDq
         X2rx9YJ3GpGy22xQCCKyQJu+LsEquUPZn7NYVtO732wwaF964tGCpiXIft0+M7EeqX0v
         YDSLRnvGGr06t4WsuwyQnJ9crIkEoHOs9WeaOHuiabYh/3vm0nXC4SIJoYHktj6Y1Jq1
         9fsAwiPGYEAWB8G8wHiOM0bhJad+3VzhCrk6ut4Z50WKNo1AtIMno7TfO2Mku9Dzt8Y3
         3NKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061894; x=1792666694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GLbZq4oFla9HIu9dh56ABciRqX8LjjTHmE7ItkbBnWM=;
        b=QmGRrYiU0Pb3IoFGIbNF3z6XWqtPcqGWGRw29oBD1kVNWsm5WgitfmY/q1WOM/zXd4
         xq0dvEtINaC8fpa0j3U1sZ54vAXd5WItrnLjUktUMUXOIFElxUI7dWbLyYK0e0PEU8TN
         77PCrRIh1bG2UvzaNgO8ZXWOIieZpQurjrMwVQlicGKv1s9rAuK1o5wrmPCB5Zdu8G+I
         2Mp63T7sVSy+uEB1uIacGrSNotAkYbYnfbKum4BA63jiQuYLy9eSUmIYRcMPHzebBidR
         5h+QFXUnCCj4lZO57spm2X7844XFbhOb7dELiUOQ4Qmg6SgI03lUVXSggMiGTEHM80PA
         M5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061894; x=1792666694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLbZq4oFla9HIu9dh56ABciRqX8LjjTHmE7ItkbBnWM=;
        b=UY+w13mUgFkVE6xLh/4fleQAvgCRO2jykwRyVTb5FVbZ1TVm/r8aljr/XH7J5m2zdx
         ErTYB/1uzD2Zf2eC2lesobpSQ4vqtqL1QKETA1hOWD3CnukAt+VJ3pq3E8utMBeJQgvg
         hA3+EzW2WXoUJvGlm4uz4H6SBk2GhtjnGs9ZR9FaW9j+hvuDyUdYJhzCmO8pWAEJqPf1
         AP7CySzhvu3F2OlaP50QyCyrt9R2pCm4JRhxGgJCRTFP851P8BY/5iI1y90zYBKhU9pn
         y9Lx21sbsIjrPFG6ONX0MXD+r1s4huY450CIAbMSgT1Izbspxk7VznMZdxv/j/cSeo67
         emsg==
X-Gm-Message-State: AFq9FYJyzF+LD9ViT95nH3/5ZIJfHhdmD0Maf0DyXXzT35auzb/gut6w
	J6I0KTtH0pzD10Seywa6iPpCddLWRjtubpmQhO7JYgjejzBQLCWpCt0fU+l72+Z2CRhM/ny0sqg
	MVYXZ8PmaQ1iHE2SSXWdJyQzT5zy9tB5FdYGiBYY=
X-Gm-Gg: AYBFou1iJbh8AjYiBMYSsey7rd2yY/dg3amU3ZANYt9qvDzHC3C1zEdua+dSlFmx9uf
	dQXXbaz3mseXUKWimujuyMi/hLXfjq6qFPPvR0EIG2xKii0YZNlA/B5tIPlPAkFEpcKyYhqOq9U
	sFEwfDFuntRBBI04Nk977nuJ4d3cY5xo5OKqbapLWPT/SGtdYENa2+Ru3ybDOpJaV3Z8WEVGDID
	PsllmuSm0/FKIzSPbiHnzjIncsB9TBmxNJzhiGkYjOoWqSTPNZ0+Db1W2oQMTpAS1MSs+35hCqQ
	S7b2ztMRnpD3dmqrwXzeELiSrR/HWnEy+3qIJGaNFc++QS2qMPF7zC5XYHNAdIAszM/BfY7kZOZ
	Jai9abgApsDd8MGGHD89Mo7lBkH9LZnfpwVwOqy0m0xf4HzaF/9zdOnD59F/pPLwB+7qlzg==
X-Received: by 2002:a05:620a:4102:b0:93e:6481:c8e0 with SMTP id
 af79cd13be357-93ec1351090mr2575765985a.10.1792061893935; Thu, 15 Oct 2026
 03:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002171133.50969-1-danielmaraboo@gmail.com> <87y0c0uroy.fsf@trenco.lwn.net>
In-Reply-To: <87y0c0uroy.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 15 Oct 2026 07:58:00 -0300
X-Gm-Features: AclHuK9t0p5LL-ENcPp0COZW6BVdnC_5YmWkEaw9RiN-IXD0v1KuSUhPE-VUNAY
Message-ID: <CAMAsx6fLw-pYS1_4DFF0c4_6MtdcdEfhfuVZukuqQ8jyTXXw5Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] docs/translations/pt_BR: admin-guide: add multiple translations
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 14 de out. de 2026 =C3=A0s 14:18, Jonathan Corbet <corbet@lwn.net>=
 escreveu:
>
> These add a huge set of warnings...?
>
>   Documentation/translations/pt_BR/admin-guide/bootconfig:422: ./include/=
linux/bootconfig.h:31: WARNING: Duplicate C declaration, also defined at ad=
min-guide/bootconfig:31.
> +Declaration is '.. c:function:: uint32_t xbc_calc_checksum (const void *=
data, uint32_t size)'. [duplicate_declaration.c]
>     Documentation/translations/pt_BR/admin-guide/bootconfig:422: ./includ=
e/linux/bootconfig.h:76: WARNING: Duplicate C declaration, also defined at =
admin-guide/bootconfig:76.
>
> ...lots more...
>
> jon

Hi Corbet,

I really didn't notice. When I sent it I was on the plane to Prague
and forgot to compile the patch. I am preparing v2 to send today.
