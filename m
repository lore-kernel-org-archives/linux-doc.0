Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792934732;
	b=yjW2T4ujVYc6LXdPkyGacCYjT5MNif9u9baqqQJO8obR7keoi9NQzt3fiyMd/TFi78cz
	 D6QXeKSPSrd+ROSDxtYcIuv1bypFpIy/iEMyUzlmrmqy0hSo4tNGk90/hQ9NuuyiBR00J
	 9i6tk9UMSvrcdeRh0VBtXFm1A/MTwasPDhxEskqnrDqZ+GLw+8DBfOfxD/EJM2QPG5U3L
	 kLThdvS+fma2tr+obDXjru4L6ztnlI9QQTv7RIUqN151d8tIPs54tTC/gUXswfFWov+q8
	 3yXOOBRSXNf30347zE36c+SqTaNZ31K7IGFksBngzruMOU8urOT5YyERQLQQRO2Wi+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
	b=4+CC6/ie13RGd/tGsjS6zy0ibUbMYLEP6bnXW1BDsH4C+OgnKdkV0+xv6iSRlk43Hehj
	 xWdMxqfHmXOI4T5kqVP0nJ+Dx2J9EDgB87wA57gITTLKGSzYC8MPclmOPb8S3NS4sMd2K
	 Cr1IbQyPaUSiW0vGlZIQJeX/PnoLU599cN5+iYA7t2qTCEcWkXmyLroDqVs9qYuji+uTP
	 jkS/aZaAzhVnacE4fhnxQiGwUBHKnPr7W5dCNT2eLAHQ4gZ0HLIER/lNjUYOfvhwP77Xw
	 cl3JnllCGqUcYLikIYK2qjc1gELnBAS6r2ULtdozrOqBLZqXMWw4EmgyZ86TkpC8BKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt;
	arc=fail smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC31606A31D
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC31606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EHrJZaLt
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b8b456dbeso26753626d6.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 06:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934731; cv=none;
        d=google.com; s=arc-20260327;
        b=EW+SewXbXzO27XKLqAT6sbv3QOkBbtDa6vxAvIXnUH7oKdgkdIWi665Ll/voxqseub
         +XKz2iHAVm0SxFcNqLs6lzXVcM+52Z3PnYEaEDDtOEAm+yASOrUpf8TWC370rCzhkXb0
         MERQ1aoKk8dDxax62U7nZ3XX23gvzOfqWagdRbWv7OkipqOGGMxi8NfhrSBWmKAtY2Zc
         XqRWxFcp6uKhoufdhOPJOocG4NewoCdVvNeFlb9XXI6nhYcyJri9g9j8GbL2lC0bnBRC
         7g1IaHrV83iuOwpTDD/h4MU57KNCo+PuaHam0peFpbfQd7+NlWc701fqhgGHGDs+31UT
         iAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        fh=Oq2YqGroe+9AyZvzARIaWl6B3SxfZp5KQlLfMZQPuFY=;
        b=X3lnPGHXxNJE50Lasl1G5iXnZMJtKwKZcyoFZ0XNIxXZFyOn7y9+j00fbjUNb6LDrv
         yoYTII8BqhdkyAyuPlsJxDBt/oKH9PqLQz2XVBTvRUCuv3C9uFuMsdysYrepAz8C5fjw
         oxWtDtPHfmHe7ucmsTIJ6gGQr65srJxxWOpwxJhVn23o2u1Q84YrjTWPoxaHEOSqy7+e
         3JmMuMXyk8IQSo8ccDm/2dSTRbv8eNx0jbgmm/9tk/nteYCllJ8QMckczgyIjSIdSsLz
         +4bcV++XU37VjPK7RsOZnGjMnwRX+jhQc4zlIUQbplPmPE5Ncu1GvsV+i0pkMasKan2Q
         eaLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934731; x=1793539531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=EHrJZaLt7VtHx1yPQ10O8lA7efwKTyBBrss4U2TzyzskcZWD/Cl1vDMWLSemzmGcSy
         05pxNF//4W5lw3GnguMsycI1rXKU+yVLV2WQ0ZOWd48jO4wHr65waWsdjrqxm58RM4NU
         W9RmPpCzZS4d79Y0NBPb/wChJHF3kDBY1B3/Logmoe4mkOlsV5NES9XQ6WuZwFIVGUwy
         BCbTn/cPLibvdW3WevChQIYSS+f4WJN7IUoEX+/ZdPO/S+WbIwfoec+Pyz1hOM58DajV
         lKkztwJvGAo7pd5IXqaLpkxdK+KIuQuZfR7UDO6kZD2ZlpyuGWUAsCw6/siT57GKeir+
         Rsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934731; x=1793539531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guXEOoyLZuS3syWsAlTfoo1CnrsW8IABAZ2MXop4xeM=;
        b=aV/QClg32oJH0ppliiVdmveBKJuifTlNdvTOpAz6c7g5aREwZO8OMXkyO+EOpfQ7af
         cs6GWHwoM+eYamRvPjcyP/bXOGjXr3CZFU4hdPhtcKpv+q/XzWZXPtZRvoXXRFT+6CWZ
         IPf/vPjBu0zOtUgczbK/gm383+j6RW4gPGXNYVDTK7/cSret2z7eKmLyDfY3+/1jKYD1
         +dzk6IFBl6qyYTKetkh+l6T7bPjVu6itORdsgT9cwHdenfRJXTC6FDUN9tQuB3RYb0QW
         Er4dtwarG9bmxzt1OIcYZ4mCgSelj6lxy/EexVyycplERiVPhUxGT7tgeDZLQqbslS1h
         vh9g==
X-Forwarded-Encrypted: i=1; AKwUvByY/hw2jrDFZKgefbzC7j+vnQw/hCxbENK0VOWS84oL3LvzKm+uJIHF7uaO0wtbj3ubVqX90tpnjRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdbTvjO/7xFPKrRFm8Fdwba5rIZrMvB3ZnqH/vnZ29vaAqoh8i
	bRLxlv7XAeSpJ8AU1PCgof1rRh3Pn2TOyY9PwqnfdIA+arq1e4i+bABCEx3LG1gpUmnBaxyB3V3
	UAGmQmmbAgROTnD/+N4ZpqqG+1ewsCJs=
X-Gm-Gg: AYBFou2EXGdDI7siO2A1/Y3MfqHxxr1taxrOiysXdQd7MF9zSpCR08c4uAR1c3P99E7
	POCqD7iE/rLkRQ2TlnywD0sFRUETf4SycgsznXPvsHyPOEkcNudjDn0CNE8y2vO0+zgoa7k+/z9
	idG0v0Db6/+EuVK1Jd/PRqe/jwMJETboLwZHYrpMqqCWb5IdQomBs/X0sSmlb3StVspVjRbp6Ab
	6agzZ9/zD+l4qTOBJlhvt0X5D9u/EX/MurNIi5P76SlAEAUn3H9B96Pbime/XSNkM0g3b51YOj1
	F+bNhiOOJF9YZEs4MOGN9tIFHrOv5ixy5WbGUcfQH+ObNmCLZ3Q8ND88R6s7Fkgmb4E3MqfOHcq
	ez4DfzngQexiZhOBKv2stlj8s8v/14b/ek2h2vF/5gMvHG/Ugr/UW01QeocEkfakqE5cuZy6O9i
	P9Mhy/a9OQrDzJtS0ieRkS6RrXeA9Er9scym56XGpnX3LbaEzA/L+DwXdGrkaJobgiNK+Qkq/b
X-Received: by 2002:a05:6214:76e:b0:914:4376:4ef8 with SMTP id
 6a1803df08f44-91c48d17173mr71961046d6.6.1792934730661; Sun, 25 Oct 2026
 06:25:30 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
In-Reply-To: <179250646543.2190262.8632957027583518623@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:25:19 -0300
X-Gm-Features: AclHuK9kZbLYrL_1P7Nb5PvMxv1l7G9aeHa0aDH5ksgUMzl9ooOaFs_24PQ2VeA
Message-ID: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
To: eugenio.zuccarelli@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Eugenio Zuccarelli wrote:
> +- ``--summary``: If set, prints only the summary line for parsed test
> + results, rather than the result of every individual test. Does nothing
> + if ``--raw_output`` is set.
> +
> +- ``--failed``: If set, prints only the tests that failed or crashed, along
> + with the summary line, once all tests have run. Does nothing if
> + ``--raw_output`` is set.

Hi Eugenio,

Thanks for documenting these. I compared both entries with kunit.py and
kunit_parser.py and the descriptions match the code: --summary silences
the per-test output and only prints the summary line, --failed prints
only the failed or crashed tests plus the summary once everything has
been parsed, and both are ignored with --raw_output.

I noticed two things while testing the patch, in case they are useful
to the KUnit maintainers:

1) With the patch applied, "make SPHINXDIRS=dev-tools htmldocs"
reports two new warnings, and that file had none before:

run_wrapper.rst:331: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]
run_wrapper.rst:335: WARNING: Bullet list ends without a blank
line; unexpected unindent. [docutils]

The continuation lines of the new items are indented by one space.
Docutils wants them aligned with the text after "- ", that is two
spaces, like the --json and --junit items just above. I checked
that with two spaces both warnings go away, so this may be a simple
fix for whoever applies the patch.

2) "Assisted-by: LLM" is not a tag that Documentation/process/ describes
in docs-next, and
"https://www.google.com/url?q=http://checkpatch.pl&source=gmail&ust=1793021034312000&sa=E
--strict" reports it ("Unrecognized
email address: 'LLM'"). Documentation/process/generated-content.rst
asks for the use of a tool to be described in the changelog instead,
so maybe the trailer could be dropped, or turned into a sentence in
the commit message.

These are only suggestions; how to proceed is of course up to you and
the maintainers.

Thanks,
Daniel
