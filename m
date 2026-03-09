Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CF43BED75
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081610; cv=none; b=q3UlwtZDTKKfw2fgqM35jC//LKn66DoEWpE000oQCgWLmhIPi2j0m+JQliWQM+ROxzJykL8TWnowDD8N0XP9gNo30l7rF4EwLN4Sx1TsP64QFhSwo2ciMrhSvVRF1oA9EYEo8N25pAGXu0S6Jf2x1jyn0Iyso9n4A8uwsBKh2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081610; c=relaxed/simple;
	bh=Rm9ju9C7zGqX4zi+4bcBnh0tAbe4lY4A0PEi0NI2lDc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=JDJsxPcVN7pmIntU5PzyCD7jFF2dKR8wNMJKuEcjIrMEPl8ZMT6GPc46pncr+6shBQk9slzvPPPcUeKbFnFfP6XjNtRSAjjjlYvhwa0CBXxaBAax9iR+v0GOkhq9XF8WhQHZp6Cc6J1c4ch+cULexp7BGNCsMOfmlaNC2i4+hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGD+NU4g; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGD+NU4g"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae3a2f6007so67337225ad.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081608; x=1773686408; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rd9zk9JvX98f/Az0TArJAGomAXgRJmfryFiyIjHxE7Q=;
        b=aGD+NU4g1q7OPEaGoP+PS/ajHFSfWgdV0U8d/M56mmqxxtOzPzDnchh5p6CgtmvxAB
         Y8FFt7WDwpqsnOBsuqsg8Bk6a/e6eLHVxStsj6WVA7um7BRyI5nxKLTW3RtlFwIznKcT
         VuBmashGveqXckLdn609pJXVdYQob18N7vYRrbhiLVfCYSKKh5ipZCbYs104kb4PouTB
         AtAHZQ31vq0lu0s7oCdpXBOcn+c1Ygd3UzOXmcyk97wuU9hFtM/71t1+qXILer0BGdmF
         lHDIjFr4pTd4e0/OvFSkYUkz8ZxbyaiCz/nmwK+ggIhCBfkuJfMm+p78anyfadjm0T4i
         yxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081608; x=1773686408;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rd9zk9JvX98f/Az0TArJAGomAXgRJmfryFiyIjHxE7Q=;
        b=i9dUTTrIO/4l6QxrCvaPH926nFSp1kiL3wEnXTp630IWlwB85zKrloL9KbwYYyMEjx
         u0MTtmDm57kkPpwsElmv55d2mMmhTG+W/WQqS9mxeCJqhsFdzIJRlmCqkl04rsPISfQa
         wKVbqJr8NxEBPK94Mg4j3roRWQrITB0US/6Q1RhA6CGcX8Nkfxl2qZ55RvPmZA22Swg/
         himIwmOtucRuZSXvxUc2/01qhm+kztzrs2kRF54MbN+D88ItrS+iYkXaeRp42v2y8bzI
         rjQ011Ybyx7TcnVbTDV0qqhgQnxiRPJANIUqzuTmsOMw21WHMwigYbxiY6NdDFtWY9k4
         f0tw==
X-Gm-Message-State: AOJu0YwBaLuP9hSoRtdo83klxJ8Fpj3TXMCOpZD/okRxaOx0qS9T3cJW
	laAQgXhq7LcdLHQCaIVKJJjJRDXubDDBciTZus6RzmDKVnUgoioQY6A/f7lgkautOFpHEg5o
X-Gm-Gg: ATEYQzzAsquCpBQcXy2mj7jI8KnBBDCdVcX5rP+4+jcC1fXoNZ9pIrKUZSaao0PG/Ua
	pTV5hMRVM5wjnOvXPBcMzmVWHl9ntH0TSzwxg6UF9SNE/OkkAvSfqfH8WnDSKtFYyG+591npi3U
	pwe0DxWoVKgcsI+JDpHbR2VBFvuqUd0Obg1SKLP6b96541B6F/KI1QPRGv+KGaJxHvpNQLGyFJb
	0B9wug8QV7zkbvW4YKWm6uKiWQ1X6R3l4mZ/zAtndCVHIPPrakDSzNi9SATXVLeJp6wqlatZjpP
	yPIh7lo/dPsngWjM1dPNgInV5NJlfqADibuPxLirqu4lpB1LzLOqUb3SyviWE3DLCKMR0m3jiXh
	QcbLPTmX1A24JQsPr8b48/ABw2QSgFgDsBxOESEds9BudDz6SQ8EMGGRovKjNF0vqznP1BWnRbG
	VbC3iRrSkn+an5iRcOwCfgpjS5WoO19SqlnU0j66HI8N3DV7FNAdfZSYgYHvikGvnHZzw8owfwL
	Q==
X-Received: by 2002:a17:902:ce83:b0:2ae:4e2b:f565 with SMTP id d9443c01a7336-2ae823062f1mr121666055ad.0.1773081607947;
        Mon, 09 Mar 2026 11:40:07 -0700 (PDT)
Received: from smtpclient.apple (wf121-066.ust.hk. [175.159.121.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57740sm117802505ad.15.2026.03.09.11.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:40:07 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5YiY5rWp6Ziz?= <tttturtleruss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] tools/docs/checktransupdate.py: fix all issues reported by pylint
Date: Tue, 10 Mar 2026 01:42:02 +0800
Message-Id: <061376E6-9AA1-4658-9B49-EFD2C754B4D4@gmail.com>
References: <b497e871-f9b8-4e3f-bc4f-eec9c76adca2@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <b497e871-f9b8-4e3f-bc4f-eec9c76adca2@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Si Yanteng <si.yanteng@linux.dev>
X-Mailer: iPhone Mail (23A355)


Sent from my iPhone

> On 10 Mar 2026, at 00:56, Haoyang Liu <tttturtleruss@gmail.com> wrote:
>=20
> =EF=BB=BF
>> On 3/9/2026 11:54 PM, Jonathan Corbet wrote:
>> Haoyang LIU <tttturtleruss@gmail.com> writes:
>>=20
>>> This patch fixes all issues reported by pylint, including:
>>> 1. Format issue in logging.
>>> 2. Variable name style issue.
>> I'm somewhat unconvinced about that second change.  We haven't come up
>> with a coding style for Python code in the kernel, but I think we do
>> want it to look at least a bit like kernel code and not just defer all
>> decisions to tools like pylint.  I'm not really opposed to this change
>> either, mind you, but the process of getting there worries me a bit.
>=20
> Dear Jon,
>=20
> My initial thought was that 'HASH' looks like a global-style constant, whi=
le it's actually a local variable. However, the lowercase 'hash' has conflic=
t with python built-in hash function, so I renamed it to hash_re to indicate=
 that it's a regular expression.
>=20
>>=20
>>> Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
>>> Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
>>> ---
>>> V1 -> V2: fix variable name style name and keep the format consistent wi=
th other logging format
>>>=20
>>>  tools/docs/checktransupdate.py | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdat=
e.py
>>> index e894652369a5..cc07cda667fc 100755
>>> --- a/tools/docs/checktransupdate.py
>>> +++ b/tools/docs/checktransupdate.py
>>> @@ -76,11 +76,11 @@ def get_origin_from_trans_smartly(origin_path, t_fro=
m_head):
>>>      (2) Update the translation through commit HASH (TITLE)
>>>      """
>>>      # catch flag for 12-bit commit hash
>>> -    HASH =3D r'([0-9a-f]{12})'
>>> +    hash_re =3D r'([0-9a-f]{12})'
>>>      # pattern 1: contains "update to commit HASH"
>>> -    pat_update_to =3D re.compile(rf'update to commit {HASH}')
>>> +    pat_update_to =3D re.compile(rf'update to commit {hash_re}')
>>>      # pattern 2: contains "Update the translation through commit HASH"
>>> -    pat_update_translation =3D re.compile(rf'Update the translation thr=
ough commit {HASH}')
>>> +    pat_update_translation =3D re.compile(rf'Update the translation thr=
ough commit {hash_re}')
>>>        origin_commit_hash =3D None
>>>      for line in t_from_head["message"]:
>>> @@ -131,7 +131,7 @@ def check_per_file(file_path):
>>>      opath =3D get_origin_path(file_path)
>>>        if not os.path.isfile(opath):
>>> -        logging.error("Cannot find the origin path for {file_path}")
>>> +        logging.error("Cannot find the origin path for %s", file_path)
>> Why was this change made?  The first time around, you'd simply added the
>> obviously missing "f", which seems better?
> I used the "%s" style mainly to keep the logging format consistent with th=
e other logging statements in this file, which follow the same pattern. To m=
e, using f-string or lazy format.
To me, using f-string or lazy format are the same. ( sorry for the unfinishe=
d message)

Haoyang
>=20
> Sincerely,
> Haoyang
>=20
>>=20
>> Thanks,
>>=20
>> jon
