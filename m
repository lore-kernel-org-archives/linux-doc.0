Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652794;
	b=O9InsIY/AW7jI4f8B7JO/yrVWdzqr1+u5V+Ru8g1NOUIcLTVqxkuaOCDo9dPD5sZzvgu
	 wkIZ6iL5ilC/QGCl1hYa19OtfKNxRDPA68etWPz3+QB0Iu3toqGPeHlt1L5OdqhnAnrZd
	 t97zH3wGAIPdxkpupPfKm8ECT85lwR+5sRAwlmLPKYDdcSaUzRNEsYiHcUKfHIlr3409b
	 c9K2/d4VVgpI0ZEvk6cRF9LHESs63dS93EgeSxHL5vReQm62LarCzf1Dff0gYQeTTKbmP
	 84S3pXo2LGGVX9Gxm6QI14h+80ojFiNC3B2oEHrp3OanS0Y5NKBKSLM2MGIGasWFZGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652794;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=YbopToXdjf5RvmN0ERyC32s6jDmB5hkDlfjdh0QlbKaHnlHqkf1CM3e2n0kjztxvvySD
	 Z/D1tA5cYRcOxFkqZr6q5RjkMiobOq7jqNXa3nF6MDHVBmT+V9qpDQMUSB/GDYULGi3/Q
	 8aePKZC7al3CZ7TnincSvIP2YdJ/bBTZNVywxRJOYxoZa8wLj996PD53k8OAeg4krKE+2
	 9JEX54DyeJFw6gHKYOnVlqab6OA2En4F9C1eBtbbgbSwKeFykMBAUV7y0b7mLoOZlLZam
	 5Ff9AuZ0E9fJpqSPYzyQJ06oXRw8mFXdvZKaNi7Fs2Hz1P/4VvWTASaS+CYMjF2vEhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ILbC3qNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B362606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B362606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ILbC3qNV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=JrjqNRqP10lz+xwTaT1N5hOMraQMewbNcL6ZPtYs/6qBeMDZq5lyggz1hz5TUE2wvCqKwM
	IXQbQRbVn/7mLpXXty1C0A86MwLFP717upzSrzHF5Nt1PiF43MqFrw00/Vf94oFs2+EMGE
	o+EsfhfOm9/h5ijPwHR98WSryq3gxtk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-ygjTTbYYMOewcP_rByCC9Q-1; Mon, 02 Nov 2026 15:53:09 -0500
X-MC-Unique: ygjTTbYYMOewcP_rByCC9Q-1
X-Mimecast-MFC-AGG-ID: ygjTTbYYMOewcP_rByCC9Q_1793652788
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3ab3fc6e459so290171fa.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652788; cv=none;
        d=google.com; s=arc-20260327;
        b=cov7iw4rFBR7azELtSgZXJgQbOLV6NFulLL3nm89nV7nkkEhduT7gS/sqPKQpa6pt4
         /mwc+B+Tf2aq6WbjNZUhoFJMExawx4ZP3+LH6PwYSq6NSPy3LldeIfbMJLLSfBlR2QL1
         0PhXEJX5gBh2YTGR12f+8V3W/BLmLl42amtRJa15hkQ3SBbUGD9Am/hbDOOg65B/Bgmh
         HajkRLDLzptbhHWIgDXnerxiVH1pAz1rbIa+mpc3LDNcWClGRv8zJipm/OZuOw3QHYs7
         sxeDdzTcwwgn7Lnyf4TdcehEIaIrYR7Yz1uC1mRsFkw617ce1Xj/ZH2kKrKwrgoZ/dMT
         yPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        fh=Vt8wbVbAfaoaxZ5mQHzLOYWPEwMGv/mv06k/aqS4zek=;
        b=N0R8hAP7t/2kpGDPdvS6XYXKHUEGzAmCBb8lpHePmtsMaLx6MM0XxZ3fNeLXtD6FvO
         9LydMWeaXD2MGnYveai/8IwsDlTaqNr1wJ/yeHEwUBymS9PoEnIcHdz7zqDI9SUGtA+A
         CMkFTP8IvWj/9dcjfueqjEOWb6ZMevfWaJVOk1/Omlt6YQc4bkgs6Qfoga54eMWoIgUQ
         JUV5WqUpq2WqNjFMsiDa0PPE86fD85nu6krgmUBmJO5Q80VG2PGgJlR3NzcjQq0yUI2U
         mYmJcD1oo5HoqbJYNGTCQjFTfL3hdnWMWCbLHcXCxyA4/pBLaP61dMSadizJmWd0iS0T
         9IOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793652788; x=1794257588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=ILbC3qNVxcxSfLLqiEMczm2K9EWJDHjQ3jtHiRo8lvs7xOcCBk9KViZKbMYNn3rDyD
         1nRBZKRZevJudcNGThw44x8q3rGE46+/V3Lp15cYzXfiXGQHqy3zvhO0o48B5BncA5Or
         KbQ3kcHqkQQMolwwbUP9ub3434QutGVu8nmoCGzc2PCEhLmjOocqh+8d4XwIGdidYoBZ
         1xLTej5dBNXaVOsg0H9ykUYcbsfyfY1xRAFquEOh1DF007rqhduAsvbJpJIrCtz2kQKk
         jbQ0GJtS49pjk16tDcdcdHiHPoCzeSh4Rpt4Z21PkzyRrg6RuTlgqDQLYpdpsCCp4Dam
         yDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652788; x=1794257588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=bFdrFMh33uCOnOhUSrixGDvDm0o5qdxStx5av7xtvpCyJ8UBxj1W/GpYBnL39qxE70
         wBf26Sdg9avNpiGwsuUVUqVH6/dqoeT4ZA/0wHaXkKonSPa+jx1zpcKt2Ssol+RZ/kj0
         SePvflVWekrL/ccDDFiGyWU9RHM2o1zUT59uXXGT3CM1pkLuePJhyR9izaMgEm4hVJ39
         DcYMTIDwp7MAugbfyr8p8uSS8dL/uroyDvbqzAwKT6tUXjhH0EOVRw3UsGamFejZ6r5c
         EuDHIWOJT+5LAHzXVq80OUicXhV5/wu6OCuOWsZLR3T50xlbEuCSInfssrSah6hH4or4
         nw/A==
X-Forwarded-Encrypted: i=1; AKwUvBxyjiSvIO8I86GrHwzrgyL9ZF3YUMhaG0KPQSS7R4DTW0tbLYnxqE3IZ3U3kmAIbEnkrTRtTTT9Xtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h1gxT2Dgi9GGRye/Ly+DKzIEh1xJT6qUevDvZ/e6pEPU49sOA
	lXSYglsiGoaAsM0UsYYtdCMTexlJBawMdaKhoeZrGcXzNbrljfJTQsLS4h/GojObCInT+pGNPKN
	ETMYUd35bb78BfLL6GHEvO9isLUAHEjC1PgeIUwHwhMRpQXVgtypQ5UKuOvA8ZXa845Oxv0m0rn
	1KA8hMYSpMHiGuq0KjHH4OBZQgzSJAxctYfkHn/YYiT26XpzRnGQ==
X-Gm-Gg: AYBFou3g1MSi/kCltutEamONK6+KQB5QJhWC2u4QlHqrirucf/95/DhwAq26M0XhCsj
	9S6ZQfVLWndb72+ZTYhSJOElYA9aYUGi2jInKjQMqKlp/UUTkUcNVGuuH+XH070uVYRsHANgOTw
	nDyfRosCqwa2GXGyGvdtQUgsqy3L6PBVfcTcye879699+a6kohQgpsJncE
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr20499241fa.13.1793652788269;
        Mon, 02 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3acb7aa83b1mr20499011fa.13.1793652787872; Mon, 02 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-6-irogers@google.com>
In-Reply-To: <20261027223847.652884-6-irogers@google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:52:55 -0500
X-Gm-Features: AclHuK8pGzNf4aGPekLa6NQcs521xOugw8djA3E8ZMCjZ7yn89XzG5j_wIaQNFk
Message-ID: <CAK-6q+j-MS_5St04YFU11LG_Cjf1jOuS3q33qk_iK=7TE-iuBg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dlm: Free dlm_ls in kobject release callback
To: Ian Rogers <irogers@google.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>, 
	Greg Kroah-Hartman <gregkh@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2026 at 6:39=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
> .release callback and dlm freed the lockspace structure directly via
> kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=3Dy, freeing ls before the
> delayed kobject release runs causes a use-after-free, and unloading the
> module while the delayed release is pending results in an instruction
> page fault.
>
> Add a completion ls_kobj_done and dlm_ls_release() to complete it when
> the last kobject reference is dropped, waiting for it in free_lockspace()
> before kfree(ls) and in the new_lockspace() error path before module_put(=
).
> Also delete the kobject via kobject_del() before stopping dlm_recoverd
> to close the window where concurrent sysfs writes could wake the stopped
> recovery task.
>
> Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
> Signed-off-by: Ian Rogers <irogers@google.com>

A somewhat "big change" for just a debug functionality. Althrough I
agree we shout call "kobject_del()" early to avoid additional sysfs
changes during removal.

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks.

- Alex

