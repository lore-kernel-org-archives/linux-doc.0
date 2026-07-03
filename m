Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4791FECBA
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783103980; cv=pass; b=bc4rInhOHcmjH2sMpGyy9xphKMHRZXao5Z1TedT/cmu6fsKXACz68HhrYOjLZL8tR0mC7VED3l6vuxLPl9HK2C0AqB3jBn53QnNdc+PftpmWYkh+tcTP6KAazte5d7Vo4KsXjU5R1qK8FLmEmzKCnO+odAIdtUdVJd7GRDVEjUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783103980; c=relaxed/simple;
	bh=jT/PaOgNeVjtBIhaByFafGKi1OMVQh9vh/VxwLsX+DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r72A4+Z0r4XRmPzncp0tUMllWnG9RtKad+iRzCWxUIG89HQOT2XvK1A9ZvkViZwl14zzrgkoYcqh5GwnBmQ8S1H5giXG/lAwxPaJGK7Z7Qq5h9a4Cmm7ep3SJOwqHytf2LdSGlCHgsTVN4OWh2K3WVuS+gare+hH70msR8cdYRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt1/fg/3; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt1/fg/3"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51bfe810293so4341111cf.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 11:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783103977; cv=none;
        d=google.com; s=arc-20260327;
        b=mC1L7cmvk/xoFjsvQ7Aky7+3fFXTxTSJ4VzxzpnolgFWC/Xd2bPCzqGO/EoHPKsHs8
         PL5e0oi6Krw4dJXqDqPOXqh9xJfU8hcSm/YEkdvdXFWnoNN8jwr+2huZ94vPpjbt/ieq
         2TILMiTBxbhGRDazuodKJ9o3ek8NiZP7d7TaqDV1vNISasgqSqvj5N9WTzeO+xqvKLVs
         aJBLGsbpx73EeAPibeHxPPP3qyB/H2328WPhUXkokZJlnttA+eWqfMi9VVh81EP9xm/6
         IMqH2SjM9hkSIXezf4WCqCp4fkPfreW3MWnb/QLiEvvs7TORvu3hv1xngsPoOTkkGZZ9
         +uDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ewxW5C8+gRFd8KCsz6DJwR7vPRLIxue/jsW9bBzaGBM=;
        fh=wpRJ/C86+Xhzo9Jb9izaCU8gGEqarYKlyrZkP6Cgwzg=;
        b=kApnSS53X4BsTCW2NfizKYU/2tPjF8hcviZQSOzzWc7AHVBfIPgPBHJlMEmXHQNbPB
         RU6u6sal84oZrb+hY3IFvcP3EAwqs2H8xWqqCw1JFVeJPdGgDDmwMw7SrTq3NyOZXoIX
         ZCH9Tgx8vaIVsxGIZuPp45ov4gdmZWf5Rcf7VdF8pJxl61l2LMPlr1iXp+Cv85VoFplu
         T8TzDBV9UIXOyZNEIiejiY6fU8G9GQ7w636EZ2W83qN0lvgAgJF2Z9C3jpe/DqIWbedq
         eu33iULCJ5RCM0+4C8shxx1dV2R5wdGDnbH+/c8rONCxiuk/efVKNLwqFT8drkgIhCjS
         eo7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783103977; x=1783708777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewxW5C8+gRFd8KCsz6DJwR7vPRLIxue/jsW9bBzaGBM=;
        b=dt1/fg/3mQeN+cKtq2yaRjRLaH0p4g3S4zx7mcEkuNOa1FH+1gqcYbluYVUOW3CF3x
         vJ2EJs+ov5CwFi1o0OfUg+9u7N9lOpaS5l139oMYUBpKVIALhn7w9bC986qC0TGra4kj
         Idog3rbKG8sNgtPDznSp4A76a8DfcwoSVQHHwLdsv5SWfqneJbfzf6xKUtMZshxaa0aM
         K8E6b7P4o5eFPlR64gb1cnDv7CQNukFBrCX7hPBWklMh8TTs4Tu4U4OnWAFBUgzgZwNP
         je16zg8MCM59812hBdaorCvpzQax+UQC1DKzIRWDJaObsbB6rtYkb3nJ/v+3DST8vR1C
         oHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783103977; x=1783708777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewxW5C8+gRFd8KCsz6DJwR7vPRLIxue/jsW9bBzaGBM=;
        b=GCYPha55JO+Kt2ciIwI0ed+8AmcfFXd3sJupP3rbN0crhmhqyNtylCwtiUEU+o6x0w
         Kr3ghVP9syYzcw83rGhdhI2S8CUJ2+5OjtIpTFLnzzScDLamfq6qSsIMu8h1FCJJi5FC
         DLgpgHfgZj6iG7f3eeJPWESAH224a1DiPF0E6uM35UCxbmWOSwJ+cg2MbE+3+bOa2OKq
         Ww2UvFtWWTM+ePc1zlJm8fXstgkQnqhkVlkWEzpRJO8+9IZTkIIku8zBKELvMN1o1FgJ
         GsYvVhb9dsaLwEWd5rcYvMO2jRI+MZBn+jKbPLVP8zEbsEodP+3+95h91HYJ4womwkbX
         2rtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MtxCqAey77RDoQQ0dOpu46EzsEFh/6U9UMtOr9itZ/Nvy2SfEauQJPr/C9T6mD2kjPzh6b4UwNVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnaEmHcDAtDc/XuOcyTQZfYax8Au9LvTrmR/zNqGdoR06/FX9S
	UoO0bJILqC23R6182+CCeiUmR15c47CsNZNCrfZGaPxHvoxAmDcFxdHGS0TpO/AdE/Bwn+9uSbh
	klXNmctwx4mM+zL/Nfx4QqtdUyN+kuns=
X-Gm-Gg: AfdE7cnSuJGSBesbgs34cRCflO4aq8RE2NeFm9I0sJ1NVcY07v5inv6QvTVvZehuxOF
	R4X01P6Fd5YeXWI2MT87yIxjErFSCyqabb7ZAhOxo8oqbpkZ0oPykxfHGp+iesod9RZb3k5OMSW
	+IZMbhTbiCr561hrKvmdqPpAtUJyNmZRC/ANBL1HQ7JXjzsuQMb7ln4/MtqgIhmbhmbarvdplG+
	mJOFIcj3kWwJKX17IXq0EH07/2YRpwdvlwx1zVrQwjkZND/1fq8qQMq2lrwnhi238goQATg/T2Q
	PixvHHBnrSpqQNZxauJYTh3EgC6+2ccBvgiKM3cWu77TSjffUNyMFTqUvepRyUNuDORiTVvzevT
	jfW+ffQGe
X-Received: by 2002:ac8:7f56:0:b0:51b:ff78:f221 with SMTP id
 d75a77b69052e-51c4c27c342mr10485801cf.29.1783103977483; Fri, 03 Jul 2026
 11:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703181326.47524-1-amandacorreasilvax@gmail.com>
In-Reply-To: <20260703181326.47524-1-amandacorreasilvax@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 3 Jul 2026 15:39:25 -0300
X-Gm-Features: AVVi8CdSjKTywk4tLVt94UiSN7s8VkGbV-w9OcwIZoFKoim32lwNSbTOeqxzi1c
Message-ID: <CAMAsx6ewmXd205h37LDTzj9FgFasgodNzS51KzSEH8M_guNJGQ@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
To: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 3 de jul. de 2026 =C3=A0s 15:13, Amanda Corr=C3=AAa
<amandacorreasilvax@gmail.com> escreveu:
>
> Key changes include:
> - Translated management-style.rst into and adapted idiomatic expressions
>   and humor to sound natural in Brazilian Portuguese while maintaining
>   the original tone.
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>

Amanda, for organization purposes, please resubmit the patch using the
email address that will be used.

thanks.
