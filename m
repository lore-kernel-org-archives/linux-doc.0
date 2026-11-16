Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830192;
	b=lK9Z2APytGpn//auQ3AX+qizeiHELNJeuIHJaVLvuytjkLslkGimxprN3ywC8tIiqRk/
	 XxwNZjeM2xKZLj6699cfRjijjdX0hRx1pkKo+ie7133IRpM1G0U3N3HEfKCZaupdkWsPM
	 ld8t26NvyY6isxJOV1T/2++RyRDnS9UxHbrR6xGkXlPQwjO8sek7PIlRuBNEKAMyJui4q
	 ymBM2wH+3dnEQTIb0LEcoavshMT8M6WgPFq7kNhwbNENjrau23EH7LZ9ogQc6av0oarIS
	 Qx9kwDRy8xRyx8e5X6M8vxNZ+xtF3kIqMlrjEjInrK6mSpPhF8fyQkpihJhYKqOWKFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jNDxoGnIcRvOyibd/pFO5Bv8+74WZgqVukiut0XEvWo=;
	b=claOSwFQSexZy1xCcAALQ/IYJy0vGeK5F+6CZTBx0Y41zAgVwUckoBLXSiDIf3uXcbHW
	 1kyjNitZMRDp/431twzTcYPyU/Fll7liGdjLQVjIzqr9Jk4Ojrz0gkDeZgnn5dMsymdVp
	 jJtTsdD+3jU1I4+1nkjDBDPkHTGBLYxLc8SC8QJDBZyqJjqESvgOKgy4OuHDIXZfKucz9
	 e9BZCgwDqrnYuKtWLg7DJCk6VpKE39+X2EeqXURzYQFoYjFgxvpre9nkKYp+RRrpVaGnI
	 uuOIISlu/qbhSCCHcvLbWc0+WMricbtItLd6Qb2aMeDp9rMtLE4Tqt3glp/3E8ETiTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2eSeKl8;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE812606A32A
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE812606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2eSeKl8
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4d86f5328so4426747b3.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 03:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830191; x=1795434991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNDxoGnIcRvOyibd/pFO5Bv8+74WZgqVukiut0XEvWo=;
        b=W2eSeKl8C91krRQ03F7mfRaP7G8g3z4yguKBsjX8xOBoSgFV53UWoZXe5K7NZLHtpj
         1ARWMWF0sZpOyL5nd7zhXn2v6ogKq566B0QxjpyhOozME37KiXHlfrT9dwi2OQ8WqK78
         JHoBxuULcYM7Xma39GpHUPCG2qoD4pc7u4R8lHc5SOE8NPa0t+oHE2/NK0J0OPQ7RNtS
         0F+7XGzxpl73qiG29HbpNJiq8XnisxprBSFqyk5S0/w6Ppi6qDeJxtZxD8sFwlvCRadb
         ZIPGCX7Bu3gt8u64Txiq1obsXQJJ3tuMTUA4TwgMdpxCRya8x5KUYcMMO1qTfT4p22Y7
         +8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830191; x=1795434991;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNDxoGnIcRvOyibd/pFO5Bv8+74WZgqVukiut0XEvWo=;
        b=rWJDzqqjQIa+JtjaFf6Lc4wpRu9lFBMcG9zi6Vsb0JJjZQT+blPlYQy8t15M0D3Omr
         JbsXTIPMrTsX16wFHs7WpxWQmJFMvsGmgHte9ehBlavCid4ETRcfKJnpi2nU/QTzArCR
         itkvG5bspL+m9U2QXITt5JxGIdQUVgows6rrgPRRe2fSOLYl2F+psRD15wOsND+ftl+K
         PlReO2Y4D6p4LbXG10qav5PQK6VWzrrgi9goNeHw5uDqcFLYQX26UsyC784g5lDEh4u3
         vpvD3kSkqFbF+1HHJ/lXybRlKmn87DIVkJlysKj3jfy9x09mbFvu0QNkXgLy762u7XIb
         yCZw==
X-Gm-Message-State: APuU4Z/n+qqlw0ZMyv+eUpp3b90CEYC7UsEU5rUCLYQzFc1mDJiaUkk7
	6fl2wzIR9ZrBZQsYdsJCisvfA8TyPYkUq1Iv8DeKwPYixYKh2HvBxD6RQ2wWZ/3JpET6Lw==
X-Gm-Gg: AZFdTZcI1PwXRTNQEG5osD05ZD2loBgqTCeLAR5HrqmoUhvqbVPAv8LukIJijawToOQ
	4PdeKTw4uN754w5hTyKba/WaY8z7JK/B2qyFb0q4njXkvpKOK/Nizql9iMFf5AAD9a4vEu19SJr
	xfMi+nzTA8brv7gzUdlvc5V6JGU0LQVVEqWrt5HxSxhWzdk4dw901JRuoILQHgA26IEJAkKBV/A
	uqD0/bHm0zuomslmgGFcvNjRBgkeHeV+w+2l3BKw9tr4iERHlljLYo6GBvPv3p8T3cpVrTq4YaT
	spPV7mAEzSBiJO/bimyWb0JovyAtlQrO38tCtVtzY/R1Gh09LBaB4Hvn+e6+MSJzFJeNQEnoWWJ
	W3Uz5KWVWFHT4c1Drtlu/tNT/u7voVrwcm56K6JgTe0dQBNQd6AFpTgy2H884sYAqlsxCQbFUve
	NolBreIuo2qytmf/0Vtkk54DjbJPKBPwm/NJsNmYytdwX+77VZAkyhswrQrJePgde4+Uz4iN/MS
	rPnSjdSwJjkloy7M6QT4FuuHDKN6s0DszFUXVfznstCaDFnkLPkXFLydxo+zwQ7IS9Oub5oNFqY
	FyQcxt9AgWp8bR9+bEjOnHaERJC5W6bgYgNSCIt4HL59REA6qwEGlW9qBRcUznuONcpEwbJBtvI
	VvacGch9yQacSrgRUnbeSDPRX+QN3mFxpWJ0VFugsHQcBlmblbfiTEiKzmCXuju34nfArhdK75k
	TcpamiQGdp4BY=
X-Received: by 2002:a05:690c:315:b0:8b4:d66a:2018 with SMTP id 00721157ae682-8b4d66a298fmr17293387b3.68.1794830190670;
        Mon, 16 Nov 2026 03:56:30 -0800 (PST)
Received: from Daniel ([187.45.177.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm84198817b3.36.2026.11.16.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:30 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v1 3/3] docs: translations: pt_BR: use "branch" instead of "ramo"
Date: Mon, 16 Nov 2026 08:56:05 -0300
Message-ID: <20261116115605.174735-4-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116115605.174735-1-danielmaraboo@gmail.com>
References: <20261116115605.174735-1-danielmaraboo@gmail.com>
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

Replace "ramo(s)" with "branch(es)" in howto, cve and
embargoed-hardware-issues. The text mixed both terms, even in one
phrase ("ramos (branches)").

coding-style keeps "ramo": there it means a branch of an if/else.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/process/cve.rst          | 2 +-
 .../pt_BR/process/embargoed-hardware-issues.rst           | 4 ++--
 Documentation/translations/pt_BR/process/howto.rst        | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/cve.rst b/Documentation/translations/pt_BR/process/cve.rst
index 83977eda3..a3e93d1b4 100644
--- a/Documentation/translations/pt_BR/process/cve.rst
+++ b/Documentation/translations/pt_BR/process/cve.rst
@@ -64,7 +64,7 @@ atribuído a partir de seu lote de identificadores reservados.
 
 Nenhum CVE será atribuído para qualquer problema encontrado em uma versão do
 kernel que atualmente não esteja sendo mantida ativamente pela equipe de kernel
-Stable/LTS. Uma lista dos ramos de kernel atualmente suportados pode ser
+Stable/LTS. Uma lista dos branches de kernel atualmente suportados pode ser
 encontrada em https://kernel.org/releases.html
 
 Contestações de CVEs atribuídos
diff --git a/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst b/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
index 2d13b335b..baccae30d 100644
--- a/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst
@@ -191,8 +191,8 @@ problemas de segurança de hardware no passado.
 A lista de e-mail opera da mesma forma que o desenvolvimento normal do Linux.
 Os patches são publicados, discutidos, revisados e, se aprovados, aplicados a
 um repositório git não público que é acessível apenas aos desenvolvedores
-participantes por meio de uma conexão segura. O repositório contém o ramo
-(branch) principal de desenvolvimento contra o kernel mainline e ramos de
+participantes por meio de uma conexão segura. O repositório contém o branch
+principal de desenvolvimento contra o kernel mainline e branches de
 retroporte (backport) para versões estáveis do kernel conforme necessário.
 
 A equipe de resposta inicial identificará outros especialistas da comunidade
diff --git a/Documentation/translations/pt_BR/process/howto.rst b/Documentation/translations/pt_BR/process/howto.rst
index db263f89e..712edc339 100644
--- a/Documentation/translations/pt_BR/process/howto.rst
+++ b/Documentation/translations/pt_BR/process/howto.rst
@@ -170,7 +170,7 @@ que são de leitura obrigatória:
 
   :ref:`Documentation/translations/pt_BR/process/applying-patches.rst <pt_BR_applying_patches>`
     Uma boa introdução descrevendo exatamente o que é um patch e como
-    aplicá-lo aos diferentes ramos (branches) de desenvolvimento do kernel.
+    aplicá-lo aos diferentes branches de desenvolvimento do kernel.
 
 O kernel também possui um grande número de documentos que podem ser
 gerados automaticamente a partir do próprio código-fonte ou de
@@ -243,8 +243,8 @@ O processo de desenvolvimento
 -----------------------------
 
 O processo de desenvolvimento do kernel Linux consiste atualmente em algumas
-"branches" (ramos) principais diferentes e muitos ramos de subsistemas
-específicos. Esses diferentes ramos são:
+branches principais diferentes e muitos branches de subsistemas
+específicos. Esses diferentes branches são:
 
   - Árvore principal (mainline) do Linus
   - Várias árvores estáveis com múltiplos números de versão principal
@@ -298,7 +298,7 @@ lançamento principal da árvore mainline. Cada lançamento em uma série
 estável principal incrementa a terceira parte do número da versão,
 mantendo as duas primeiras partes iguais.
 
-Este é o ramo recomendado para usuários que desejam o kernel estável
+Este é o branch recomendado para usuários que desejam o kernel estável
 mais recente e não estão interessados em ajudar a testar versões de
 desenvolvimento ou experimentais.
 
-- 
2.56.0

