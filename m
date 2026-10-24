Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848138;
	b=a6m481PbKkew5wKM9tvnSuHn8+gLutTeQSs4TZN1WJ2A05ITMQ/Ipumz3swUb7IUNofJ
	 gwxtLictWidMJ8DlZQvYIEfROLJ+uv+H1D0uSH+Auv3HSxpETzd25WHnL/4HRL57tSjUf
	 jFqJDIUa5tX7cGSyiR19N1MEzusdsm68/AeJ/4OW7GzpPQlRhnwvd15ej+LsjX/IKZD+d
	 Rh/y305P7cWIRJq0Hj+osjZf+4G4N+vP3jaJhyvuNKNhDwrR6TA+6vvDylucv8YQnilV2
	 LMvsNlaT7FzIiL9lgfHJqIlUs8zEj51z7/R/N4/AUO61TbBmy9svuCQSmUiK9EZ7L+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KcDqAwUxYI8Eh3z0iHJXDONZUAdfaPFuZGlQU5pRh+k=;
	b=4Hs7xRMWGznQA20wezUisTQk6Ob79+oEvepsxXu2/FG+GvSj0gqSdhgEv/Iqybgya81b
	 bVXkSL4F3liI6MyNMULKDSe46UnfHTL2Q0g3Ii6bV/gXkVkiRPiMtUp02Zd3tMXQoByTL
	 5cTWoN/juUqKIa8B5azB3Q/2Sv4WVmgtc5HkyoYWMd2IZh+5JjNYEGZOiEZ3idgxSCV2S
	 OQLOHQPPQJ0P1tJwG44nu/2kpjwS8FY+ZmXn2XdVR09YSRr7RhM9zM9yis+PPBzzamkej
	 3BK40MRLiGtqqC9ONuUDLs5NUaY010M9+yEEoDdh0wJ61CDy/jP7tTTIUdTzQykTwsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TmV30DJE;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB41606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TmV30DJE
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f036b17easo3598520eec.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792848137; x=1793452937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcDqAwUxYI8Eh3z0iHJXDONZUAdfaPFuZGlQU5pRh+k=;
        b=TmV30DJESvQqSTGDjfGfQCsOqEuklB9WKvPFEYa6wTN4H1QDWykPcKTiEEYZBJynpo
         rCx4GUImlKxDkW/yurtlVsXStBVKE8pHkWR1y+2tdMg79tS5mMEbcWQqMncGNDECVyt6
         5/iA6iXcLYOJ6Ic+nw0jPov9mdV7NhDlQl90qfS+K+1u42y/6Elioim2AmnR1XPqOtLi
         ya+kaMoBzn6Ixv9WFiJX/2DdDUpt6gVIK0tLYxffJkN0Yx3wUFDxWB2bY4qrq9PU4v/B
         gqN9giARgXAkmRGcZXn+nBFGdtDHR+V+nHgDMgSPMKjFkJtq0jI6ANTTsNTAecKpniNp
         hQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792848137; x=1793452937;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcDqAwUxYI8Eh3z0iHJXDONZUAdfaPFuZGlQU5pRh+k=;
        b=S39sVwVdHJsqKsgVz7KhJI6N3n6WeMKKgi8SzQwkfrGMeJxnf+AfoD2TT3wIU2Npbw
         4xlwv3P6eT10di0ganv4FSdZacakfRJlrmdX/G7eDeqaY9qOksZlJrNL8ypd8VAaqWPq
         os9T6jvdHQsjekixKwKJVMccUBZz8Pr7Zeb8VMsHTE3bgW9WC4BJZHmO5KW9e+TvxwAq
         UEYAuglykMT3y+/H5SPhJPVE5hwuiB5aU/zBSMkfWXRzOW4pHTHuStfx2XgJuum7io0f
         vEOiJ+NvIO8XBJN8GWVcfYch9WlVJYwicurtm0q+2XnnvR8fyTLfSDI74NmdnQds3Rjk
         wCQg==
X-Forwarded-Encrypted: i=1; AKwUvBxTVTxlm71ZOETEW0i4UfDOSP6VsbfuhhKXu1qpM72K7FFkB7q0J4OGZMSeY7G1tqbLJmHA3m12uvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF/46LrV6eeNXIzvZIH4smIghTUKhSwA9B6ZN24yzqmNpf4HLT
	gqEW7ku53efoQZU7oQjMNx8+fIpui5b1uPBkz7pvuCkh6EMkvVcmvTfOkibI3tev
X-Gm-Gg: AYBFou0AfCtW9rf8Je/I6BKnLMw+S99wSLKqee5Vwyr1U8vvfP/aWwsVTkWwJjWFIAP
	r4KUoQLSNnwjD8dL1eHp4k1JaHRCmOdzFbfKQ8DM5EeBneJLc9CTQRvTIpdiBbEiIvzIRJJFVGw
	oKehL+2d3L3MsPanbE6GijA1/PVER+HssDnMsHlAGsV3/ZaSI74smitllUKL6c4fVf+eaA6mTai
	wmGieXiVY1xvBmSU4SItSkdZJd3I64kGVC1ifn3YEHuED5QkFq8IH6ii0K8aGF9qyI7IsoJaesv
	VvOueOmAM7wKN4UGHB0Ei7Q+RSUYmD5oS8Kzhyj979A/mN6trG6LC0Ekj7qy9Br5LYkK7GhPMMi
	AYQkUF5X9dFEyTm1RFKBlsJLIbTWJ88YiZ+eP7RdM7IKk0wMAzAlyz8F9IQCju02NxhSxa2TeRy
	OzvzaSdnXtcwax4iRAC6b4/an9eSS7eXxkImu02HN324OoVdVYoe094XS56LRLaBbAn3Ab5W6jN
	qUVsSZNUo2nTcBtEkh790hbyR+I8LDTLHLZxgeTHsWur1Qn8ulmqbxZfK3oEu9lJAusQN+iqq98
	JkMf5+HBP5mGd++G3uavOgJvGS9mt61x2YFX5oR4U0+PFtCzH2dOMQtcoNrSm7w/fmjm5s47njS
	3pwDsYaI9
X-Received: by 2002:a05:693c:2502:b0:366:6644:2839 with SMTP id 5a478bee46e88-369e836b295mr2810446eec.3.1792848136761;
        Sat, 24 Oct 2026 06:22:16 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm15757768eec.23.2026.10.24.06.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:22:16 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 07/11] docs/translations/pt_BR: process: license-rules.rst: fix lists and table
Date: Sat, 24 Oct 2026 10:21:54 -0300
Message-ID: <20261024132158.39493-8-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The license identifier categories were numbered 4 to 7 instead of 1 to
4, the first paragraph of the "Exceptions" item was not indented and
rendered as a definition list, a duplicated "File format examples" line
broke the list, and the MODULE_LICENSE() table was rendered as a literal
block. Fix them to match the English version.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/license-rules.rst            | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/license-rules.rst b/Documentation/translations/pt_BR/process/license-rules.rst
index 7a801b2a4..3cbc1dccb 100644
--- a/Documentation/translations/pt_BR/process/license-rules.rst
+++ b/Documentation/translations/pt_BR/process/license-rules.rst
@@ -155,7 +155,7 @@ Identificadores de Licença
 As licenças atualmente em uso, bem como as licenças para código adicionado ao
 kernel, podem ser divididas em:
 
-4. _`Licenças preferenciais`:
+1. _`Licenças preferenciais`:
 
    Sempre que possível, estas licenças devem ser utilizadas, pois são conhecidas
    por serem totalmente compatíveis e amplamente usadas. Estas licenças estão
@@ -234,7 +234,7 @@ kernel, podem ser divididas em:
       License-Text:
         Texto completo da licença
 
-5. Licenças obsoletas:
+2. Licenças obsoletas:
 
    Estas licenças devem ser utilizadas apenas para código já existente ou para
    a importação de código de outros projetos. Estas licenças estão disponíveis
@@ -279,7 +279,7 @@ kernel, podem ser divididas em:
       License-Text:
         Texto completo da licença
 
-6. Apenas Licenciamento Duplo
+3. Apenas Licenciamento Duplo
 
    Estas licenças devem ser usadas apenas para o licenciamento duplo de código
    com outra licença, além de uma licença preferencial. Estas licenças estão
@@ -329,11 +329,11 @@ kernel, podem ser divididas em:
 
 |
 
-7. _`Exceções`:
+4. _`Exceções`:
 
-Algumas licenças podem ser alteradas com exceções que concedem certos direitos
-   que a licença original não concede. Estas exceções estão disponíveis no
-   diretório::
+   Algumas licenças podem ser alteradas com exceções que concedem certos
+   direitos que a licença original não concede. Estas exceções estão
+   disponíveis no diretório::
 
       LICENSES/exceptions/
 
@@ -402,7 +402,7 @@ Algumas licenças podem ser alteradas com exceções que concedem certos direito
       Exception-Text:
         Texto completo da exceção
 
-Exemplos de formato de arquivo::
+   ::
 
       SPDX-Exception-Identifier: GCC-exception-2.0
       SPDX-URL: https://spdx.org/licenses/GCC-exception-2.0.html
@@ -436,7 +436,7 @@ _`MODULE_LICENSE`
    de módulos do kernel e às ferramentas de espaço do usuário sobre o módulo ser
    software livre ou proprietário.
 
-   As strings de licença válidas para MODULE_LICENSE() são::
+   As strings de licença válidas para MODULE_LICENSE() são:
 
       ============================= =============================================
       "GPL"                         O módulo está licenciado sob a GPL versão 2.
-- 
2.47.3

