Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB1B1FF1BF
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110087; cv=none; b=phpyiWsyURBiN23VmVd5R/Nzu5izD7Dp2YaXknZAwOeFcLE1Wr5Sv9pKf/jiye8X2YMVKD/tUiGVqJc/1iBbUWnGGzesEbXmNqVcwqcT7vJk7+scO9FOA9WSvA2MTeBRLtdEqKhLCYnW4pDA8FfSVtegbB6wTMXUBNLpgevnzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110087; c=relaxed/simple;
	bh=NNFSE2fFzpiSASQWnZwDpNqWAbQXEhYo1W4bEKJ2yGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oPkHmJ5V0JcK0znd+n1LGYW6VNmeL0KQan+TMFJFmG+0NXRMiRvPpHV+BYzoPp2T9uv1qA2r8qvADsyDp7Wv6OztNXeoFCWB8mv+Uox3GNlsWijNtNYtUuxMRrh6P2ZpRyR+Is+c1SlK47dHzhb59p4X/58jfp8m7erU6i8A8lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7p6xiiI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7p6xiiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749110084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsWFMFas7O2Lvk4gjiHkVtt4n83KeM8DN/r9KQDAJpg=;
	b=J7p6xiiI9EkEf2dJthaoD1cvi9JtX2/LFqy/ZdVJa1vXE1OMPRvNUbV2OmciHQw+ggw+w9
	Ksf528Az+4I0U5UUz+70JqA6YU4plIP/nI7Hdyncaqq9L/4aTUbkxeIitILy/9mz4lhIgl
	PpktzbJ7nr2cemW+c8zG7+h2GGPIxSU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-K2NQ8sD-Nk2vdReiB4-8Bw-1; Thu, 05 Jun 2025 03:54:41 -0400
X-MC-Unique: K2NQ8sD-Nk2vdReiB4-8Bw-1
X-Mimecast-MFC-AGG-ID: K2NQ8sD-Nk2vdReiB4-8Bw_1749110080
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442f90418b0so2815775e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 00:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749110080; x=1749714880;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsWFMFas7O2Lvk4gjiHkVtt4n83KeM8DN/r9KQDAJpg=;
        b=YYT5H0F/cB7NocMvmzGlxdbixxUQ2ikUU6g7klRKlv4e4gxAzHnrRxETVn+RJartZO
         ytrhG1b1TRD/wxXwLBT+49u22mvgw3lw3KODkzi41s8rePOwLLwY5bN9ghNrqmODQcvf
         R0Xs6oDUxXFefZXiNGNFLV3BfuuVzlWbmK4mAk74qQEQgSZ4aVM/r8r9XRN7bAA3QPDT
         eXYyPkKf2lwsJNKDkktY0P0+Qg/8Jl7wxFMjGzOYYxLq2R+Jl/kwkhiaStXErBNrhPr/
         JJxpnJsVzUe+Qdf3JjfLF/voBkeIeLS6ijy408NBxNudgET7jtSW/ytXy7hi3eUDzxMH
         Gjmg==
X-Forwarded-Encrypted: i=1; AJvYcCU3bd/U3RUBizTyyf6v0RNMk5G/9uArjBcisFZqRCrhxYlezgqtmjiiwZk2D0Nqp/k8LF01hN4sow8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85gegIE5TYhj9Q8CJoqNR7kdAp1NY/60fZ4FLkHQNQqy1zujq
	VCRaUwzmuHwTiCO03XPJ5q8Az9fOT6rUGDjZt/yi2KSQaaTzY9V61q/ZM1Q5KR/xKQzrGtuI28/
	1kpoUquXw3RIJmANyV9gHDlGeX7QPYsClXUVo48nGHL11M4NNZ99QLz0JPUrgyA==
X-Gm-Gg: ASbGncu+/HP+ypDPYPb2/iwe2gTvcA6LpwGL5YBdoPOC0dP/sBcul7+wEb7cY/jAjsY
	HSceinMUF70R9zlz2RkOwl4H/oMfK8PTJGi7FTBw+sif5p6STU1Su78mGmBBZyMLe5aKmvsqbOQ
	J6yMEdPxHoAxlytjeKmXQhEcKZlJynohTVndPND+bRgT4I5DAL9tN8SoGQmZV96NwpKjpyPUN2H
	SChb2jr2HW+AE9HwFMkhJ7dCAvnflNc2ypcHtMDcOo75JPROQ3r9VnEeDS6eJb695TuY7XQXjhs
	iMLiit7YabtVvrsHYQ==
X-Received: by 2002:a05:600c:1382:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-451f0a5fe0amr51091945e9.5.1749110080146;
        Thu, 05 Jun 2025 00:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1SRbImSlbGm32npkuOoSxiRgAXup0UEUY8LHi/iQ53+IYu08XHv+Q7OLZVb45/K6v+57Beg==
X-Received: by 2002:a05:600c:1382:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-451f0a5fe0amr51091785e9.5.1749110079698;
        Thu, 05 Jun 2025 00:54:39 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f97f85casm16199575e9.4.2025.06.05.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:54:38 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Eric Snowberg
 <eric.snowberg@oracle.com>
Cc: "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "linux-integrity@vger.kernel.org"
 <linux-integrity@vger.kernel.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "keyrings@vger.kernel.org"
 <keyrings@vger.kernel.org>, David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Peter Jones <pjones@redhat.com>, Robert
 Holmes <robeholmes@gmail.com>, Jeremy Cline <jcline@redhat.com>, Coiby Xu
 <coxu@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 0/1] module: Optionally use .platform keyring for
 signatures verification
In-Reply-To: <f0b37bc55ed3c02569c74f0fbdb6afa8efd329e2.camel@HansenPartnership.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <0FD18D05-6114-4A25-BD77-C32C1D706CC3@oracle.com>
 <f0b37bc55ed3c02569c74f0fbdb6afa8efd329e2.camel@HansenPartnership.com>
Date: Thu, 05 Jun 2025 09:54:37 +0200
Message-ID: <87zfemoc76.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Wed, 2025-06-04 at 17:01 +0000, Eric Snowberg wrote:
>> > On Jun 2, 2025, at 7:25=E2=80=AFAM, Vitaly Kuznetsov <vkuznets@redhat.=
com>=20
>> > The use-case: virtualized and cloud infrastructure generally
>> > provide an ability to customize SecureBoot variables, in
>> > particular, it is possible to bring your own SecureBoot 'db'. This
>> > may come handy when a user wants to load a third party kernel
>> > module (self built or provided by a third party vendor) while still
>> > using a distro provided kernel. Generally, distro provided kernels
>> > sign modules with an ephemeral key and discard the private part
>> > during the build. While MOK can sometimes be used to sign something
>> > out-of-tree, it is a tedious process requiring either a manual
>> > intervention with shim or a 'certmule' (see
>> > https://blogs.oracle.com/linux/post/the-machine-keyring). In
>> > contrast, the beauty of using SecureBoot 'db' in this scenario is
>> > that for public clouds and virtualized infrastructure it is
>> > normally a property of the OS image (or the whole
>> > infrastructure/host) and not an individual instance; this means
>> > that all instances created from the same template will have 'db'
>> > keys in '.platform' by default.
>>=20
>> Hasn=E2=80=99t this approach been rejected multiple times in the past?
>
> Well not rejected, just we always thought that people (like me) who
> take control of their secure boot systems are a tiny minority who can
> cope with being different.  I have to say the embedding of all the
> variable manipulations in shim made it quite hard.  However you can use
> the efitools KeyTool to get a graphical method for adding MoK keys even
> in the absence of shim.
>
> The question is, is there a growing use case for db users beyond the
> exceptions who own their own keys on their laptop, in which case we
> should reconsider this.

Yes, exactly; I may had missed some of the discussions but what I found
gave me the impression that the idea was never implemented just because
'db' was normally considered to be outside of user's control ("just a few
evil certs from MS"). This may still be true for bare metal but over the
last few years things have changed in a way that major cloud providers
started moving towards offering UEFI booted instances by default (or, in
some cases, UEFI-only instances). At least the three major hyperscalers
(AWS, GCP, Azure) offer fairly straightforward ways to customize 'db'
for SecureBoot; it is also possible to have a custom UEFI setup with
KVM/QEMU+OVMF based infrastructures.=20

'certwrapper' offers _a_ solution which is great. It may, however, not
be very convenient to use when a user wants to re-use the same OS image
(e.g. provided by the distro vendor) for various different use-cases as
proper 'certwrapper' binary needs to be placed on the ESP (and thus
we'll end up with a bunch of images instead of one). 'db' is different
because it normally lives outside of the OS disk so it is possible to
register the exact same OS image with different properties (e.g. with
and without a custom cert which allows to load third party modules).

One additional consideration is the fact that we already trust 'db' for
dm-verity (since 6fce1f40e951) and kexec (since 278311e417be) and
especially the later gives someone who is able to control 'db' access to
CPL0; a 'db'-signed module (IMO) wouldn't change much.

--=20
Vitaly

