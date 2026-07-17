Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428F13DD523
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288076; cv=pass; b=FOlaYzqguQpgOHfLavi+ZWv9eFSUFdyqXJgERTCnwi2TcbeX0J/++9RQPsETWd875v1+vrNGlRgPCuYcBdGfO7pplBwxicIs/pbKdRzynKZIGRhZ19HuXHq2XT7zU6Ki37HlwF57hK1kFXRioJMLBHQNaeypfUg2jzM05OUIqc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288076; c=relaxed/simple;
	bh=2+vTwm4RDcYYZAFQCECL9Y4JO7LEsWRCNmc/ISZOgyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J85kvPe/UzWob3ihdhjSoVeGGV2TT+Qv5Kbdbwkjzn6zgC4ItPc6LBxWD7/nv1m8nyGtxNzb6D7VZjQbrYCt+iLxNpx9G3O8225/5ITNJruuggqtM6TqZAHBpSKG2P9U+8EWIrUq7tgkMW4qriByglz4HYDREseonqKhXxG8JGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPorfgcR; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPorfgcR"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92edb12cdf2so271768285a.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 04:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784288072; cv=none;
        d=google.com; s=arc-20260327;
        b=O2gH4mp1tXot22o5MTepmPGwmi5zT+OOqpK/p+irkNNR5vd377cQHYsqd2zGQ3b0jz
         zlcHPCxRvkUtdAR19YpGF4D4AdMoMOhrnP2EXa8OwMcB/ahJY6GEw0bYqM3fsmM78lVu
         gKEsg7D+AgnJe4PngRiHB12UI1GF2vhLOHjpwQwazsDmGk5Q3rDRObyQ0199jwR8IFEy
         XETHNUFvSPIPIgYL418+ipijqqJaMRDGK33weBTTDB+3pcvZ0BQxJkRekuZJMzzZSpH6
         92tzjm9fyilvhlFD+2j6UnKCjUDIeB7GHlHgNbAdfGZOj7VEghA6XQgefQutq5gp4Z7Y
         xo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=heJsA7MEPpoAxS8DF6RtHuQpHMd6jgOCSkDkL/G/0OA=;
        fh=pReyqUjcS744Dbo88WeyyGiIw1StcOpisS1TdeAKCC0=;
        b=dM40PQHMaj5elJHsbLD+VSOJywxiJGIK7J1cxN4k4G7jgeA12ivWfe6kpf2OMxEog1
         +CZCpwzn13dNv/OzRDOUxFlXk/cn+cg4DV4KptnH7jYjEskO7u3SbT14qiAfxZIwMtXi
         oocsfTIeL4CIguYjEK5v1xssv4YiG3YWeOy69E90AWtEObcUttRKXD10nOtuItUobQBn
         fdeCLw9KynKgREYMfAjQlOtET/yc/kwaaLaM6jB9BG3r3iXzDxV86rcSOnuAHTf5WMeX
         BxDTP4uomXv6RLlD5ZttjBl1buZdHco4p2ouhc5FhiG4+vlBa1rcXvtDITIfxHFCfWdP
         2Q6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784288072; x=1784892872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heJsA7MEPpoAxS8DF6RtHuQpHMd6jgOCSkDkL/G/0OA=;
        b=KPorfgcRDKK6rUsLk4n0VF+jLajSrvNmAV1RmwuoCbLHAXE1WpVnmVeItNxsjQ43r8
         E0q8xla7nFy/H3d90UPDFwA33hPZkrpBPFUoF2vkqs+UgjqzIDpTfr7YKXcVuzCMJkQ/
         G2XPl8jb9CGTIePIc5l7O4vLHI54OpOQgi7SKilq+id2FBdtFAzmsIr0yZLl97zJ21ve
         SPqpvh0RvQ6m3v2LoAdEBaUiejJciMgiB4MwO7AS6SdlqRBeahevgAEek0vAX1zUWmEo
         94wzaHXM7TJ1zP6TSLrKZKKjdo9us+ThXYIbr42MizKEwCOQBx8dIMoGfkPwo0JcksF/
         mZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288072; x=1784892872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heJsA7MEPpoAxS8DF6RtHuQpHMd6jgOCSkDkL/G/0OA=;
        b=Byh5Z5lS7RiZMiarWlzOllngkVkSlDwUpJLepqUXpxZ+0QXeLHESuvp/WTmzRWnFgW
         EmdVPRdZVXYPd5MpMScFTSjAhVn+uuxYcsz2x2CvQzg9YXlg/yEtx4xdmSCjsGuae6hB
         jHqZQ6F/JpgpPkbF28f2Z2WLW/GghlDyQoRJlo1Rrvlg0UnRjp0C0ywQeg+ZPRx2WBrv
         2HM/kQiPaEpPDPj8zipDdo0Wu+N0bcg+iJaqk8XXke9MCJIWH6UWjiadDz+tJx6JBxEp
         MJwIya10X2GY3tlluJfl5ZdDaPwyjXWmRnHDJHJYRr8nX8xlMv8NVtwVdTexBRelAUYo
         RZWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIu7Nt8sxzYw7/E052cXRNysPPGF4hFfJEX+pi5B6G+NlPjKwt+Hs9w/Egt3EoQIUVmsPKwRRnaVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGCmSH8vIShV0RpHe9Xl6cWZUlQGX8uBHXvEcLlY9AfgZkLRx
	taiZPNBRbTiTlczGx5EVX7xw4AbluaPD+lEy/8MCP028AVEDWmQBRpC632ep065woNiIuK4uppG
	1a3mnlwNsyz0PMNkSpmtSQB8O/8rvbZU=
X-Gm-Gg: AfdE7cm8iRNhnARNkIegh78OIu47fejxzmsjk+BxUEXnxFPBUt+g4C8WM/PX2zMF9p7
	7uajLwbcim6yPsMIBb87g6fgPom5Db5sbxchDZ69ASBOdaInBxUaG0/ccaegMnlqGlXbSxHDds2
	Lxx/Etk6xEUTSGJ+MQVOA2FwKBBba3DDA0PR8J85v2Oa7x7Mag11Sr1a4SERgaFg5t9DmzK6ZQv
	6dCe1TPbpezQk5i4GkVGbfBRtlr6yy9P6cGjxxmH2W1RyWvVAH54G69D+0YD4uDgQnBjqWW/FFf
	3tiXyQx2IRFVUs6t1wMMDXsF/P4yNcVWx/A8Vt9a1CnSTFA9kzgdHk0odxfCk75Ir/vXBhCiVeo
	=
X-Received: by 2002:a05:620a:4689:b0:92b:67e6:8ac2 with SMTP id
 af79cd13be357-930b416ec31mr201698385a.60.1784288071704; Fri, 17 Jul 2026
 04:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717014310.23809-1-alyssongleyson.dev@gmail.com>
In-Reply-To: <20260717014310.23809-1-alyssongleyson.dev@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 17 Jul 2026 08:34:18 -0300
X-Gm-Features: AUfX_mxieNk3NWRbrtSeaYV3UO1JFEOENyR1wTNAAGXjmQbn5y9ktevw4j4ksuk
Message-ID: <CAMAsx6fLqC5zzye3nBz9ByWsD_vuF4ZWAv=uEMtqedArBkSS0g@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate the security-bugs.rst
To: =?UTF-8?Q?=C3=81lysson_Gleyson_da_Silva?= <alyssongleyson.dev@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 16 de jul. de 2026 =C3=A0s 22:45, =C3=81lysson Gleyson da Silva
<alyssongleyson.dev@gmail.com> escreveu:
>
> Translate the documentation on security bugs into Brazilian Portuguese,
> maintaining consistency with the original formatting rules.
>
> Signed-off-by: =C3=81lysson Gleyson da Silva <alyssongleyson.dev@gmail.co=
m>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/security-bugs.rst           | 370 ++++++++++++++++++
>  2 files changed, 371 insertions(+)

Thank you for sending this patch. I=E2=80=99ve reviewed the translation of
`security-bugs.rst` and it looks great. The terminology is accurate
and consistent with the existing documentation.
I am in full agreement with these changes.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>

 Best regards,

 Daniel
