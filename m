Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B640DFC2
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803076; cv=none; b=mxWsKANDBDtoYdMBtK633BbtZDfl232DfSKwN14bh75uSUKWc8wJJeoY0BMrdF0UlzSKCa3kf3xO9BgBYyRnP+X1TQRkU90bKxkFnq0i473K3olZZ13GrFNRHDk+nYBUKpYvBLe+pVWJWrdHxf4SxmDLreT+SgwB7F2S9xY4RRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803076; c=relaxed/simple;
	bh=NmL9gHcXYZI84g8NigPQ5MaCtTIbv3+8UFXitG3P5Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLd/0RwLQ+YkkXtHLp1UKc3g3adcPxkyLh3iveu2ZzuIq7wCeE0DuxuxfwM9Ob94g4yTn/6JbenUusq4bmf/DF9BZr80N8FfGqwRl46HyCT3GdclollmqYdngOMjnnwJcBQYxdb5TwvQl/uFCDIl4zPEAaV8QVkkkvmboaRxP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkjFrYuv; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkjFrYuv"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso1514879e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803074; x=1775407874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeBNBbR29CZHrU4pZxqmWHnJRfcod6uzg4zNM7QPGVo=;
        b=nkjFrYuv+BYRM04YdptA0mzzH30xbasvHHMqlXScXcbc29eREvj+UR2ylouKWyIGdu
         LJ66iKwOKHf+6FasI405oC98CmzBLR7EC+7Yr4jW1eJ9baVkFn3n2Vss2ADAzEcI0HA3
         2f1O/gAKNOPP5DAUu5Ywe3fmpoRsAkfjY1s1ELOPMfBuOZ9BTJxtRDZgrmGUY6R9JNij
         h6soi7kmteAH/N2A/51rvn1hdBWC9OcZ7um4dvkFuf9/tOgFHgs52iGrlIF6XTVP0cFs
         i3750Mu4MElHiNfE08ZfAK/TkiACyh99pRY12rOmMsAfFvR5EIrm/cm9YKN0kLKtBhIU
         bXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803074; x=1775407874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jeBNBbR29CZHrU4pZxqmWHnJRfcod6uzg4zNM7QPGVo=;
        b=nsONAGhqO1zn16x69TdkGMH1LJ4FZ6hgQ/iaau6dcvMl/Hv6VdaySxeld65Q3fxvuS
         Z2GHWY2za9ZtxrX4zPMu0/+1vsIm6xoBfLSahKRcoXpjLC1Z73taRiprmWjUdI5Yfqh6
         9789zQaX6M1bO9zK2H0TzrRYcdoHnpiQ7DZu/OW6G7U2KF7qnoLNFpvkUVBNekEjBTpQ
         iVL8mZN0x18OZSfytS5+rHY1rpKPSnr3v24sYNdikub1y8reA/6ZuVUG2ta7htEVNEYA
         Anxc5zPN3lb4NL+ERtU7WQnFvgpPVYaQT4LQzZkwbbZ0pzr1kv19anESHk3b9oJrHDc9
         uXGA==
X-Gm-Message-State: AOJu0YxJYrwwXzttac274/65Eufj0jAtBgK0jAhV1wzyC1AHMiG28Ju9
	XVR3c4UZ9EKHPYkP3dpZyCDiwcdI/gyjlUng+jvbSfMDzXvVGlQ6FawJ
X-Gm-Gg: ATEYQzza2APa1nLLbHj37lLK4S1RSv2Tzf6UhBsgQ0DtqAdfwmA5qIBLCDQ0wUGXDmn
	15HztYKxv0ou7Ps/Ct5GcUoQeo9sKlyntGzfjmbqK/PQsmN9S1Te93Hl9u0MZ1zCPmD8hj6tRX+
	Uh5ufTgaxg4KY93a0JrGhKBlSZeex4K6QiFZ0SIWcd8TDHEiFwZPabroO0mKqUPKZmK8PfCP5kY
	j4l2gks6ZyQPE8SVd5e0ojpoMm4aRayhuTiHiXIamRZu9Unet0zABV/U9lI1gIfbqrMUPsMLWbl
	+LaOwom+DhUjTOfGjFlRykB1NsX7xQM2zHcQNXgZBRoaCXjtrFo6ITWe+gF0XMoWrioeVLB0yyt
	+5fQ5guDEvP4SLV4uI308oYgCFNnntm3BYqJgwr5kJ6zbtSKxlYvdlL8+3LOqhuJndDRbUoISHn
	7hI8XcFBOyscEwsdco/8/5nQmlHTJn6vE8QsJbvm2H7hsnngD795yS5uJ1IE+jm0vRSpukmKWd1
	TUW
X-Received: by 2002:a05:6122:54f:b0:56c:d623:8967 with SMTP id 71dfb90a1353d-56d4a65e5c7mr3535988e0c.15.1774803073758;
        Sun, 29 Mar 2026 09:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:1690:81f:ccbb:2e4d:21dc:8ad9:527c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm5549740e0c.17.2026.03.29.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:51:13 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 5/5] docs: pt_BR: complete PGP guide translation
Date: Sun, 29 Mar 2026 13:50:39 -0300
Message-ID: <20260329165041.831369-6-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329165041.831369-1-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Finish the translation of the PGP maintainer guide into Brazilian
Portuguese, covering advanced tools and identity verification.

This final part adds:
- Detailed configuration for the patatt patch attestation tool.
- Integration of gpg-agent with SSH for remote signing.
- Procedures for verifying kernel developer identities.
- Technical overview of WOT (Web of Trust) vs. TOFU models.
- Automated key discovery via WKD and DANE (DNSSEC/TLS).
- Usage of the kernel.org PGP keyring repository.

All internal cross-references and labels were updated with the '_pt'
suffix to maintain a clean namespace during the Sphinx build.

The document passes checkpatch.pl with 0 errors/warnings and builds
perfectly with 'make htmldocs'.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 .../pt_BR/process/maintainer-pgp-guide.rst    | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
index 3501756fd..fd19fd4c9 100644
--- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -778,3 +778,136 @@ criptográfica nos cabeçalhos das mensagens (estilo DKIM):
 - `Atestação de Patch Patatt (pt)`_
 
 .. _`Atestação de Patch Patatt (pt)`: https://pypi.org/project/patatt/
+
+Instalando e configurando o patatt
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. note::
+
+    Se você usa o B4 para enviar seus patches, o patatt já está instalado
+    e integrado ao seu fluxo de trabalho.
+
+O patatt já está empacotado para muitas distribuições, portanto, verifique-as
+primeiro. Você também pode instalá-lo a partir do pypi usando
+"``pip install patatt``".
+
+Se você já tem sua chave PGP configurada com o git (via o parâmetro de
+configuração ``user.signingKey``), o patatt não requer nenhuma configuração
+adicional. Você pode começar a assinar seus patches instalando o hook do
+git-send-email no repositório que desejar::
+
+    patatt install-hook
+
+Agora, quaisquer patches que você enviar com ``git send-email`` serão
+automaticamente assinados com sua assinatura criptográfica.
+
+Verificando assinaturas do patatt
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Se você estiver usando o ``b4`` para recuperar e aplicar patches, ele tentará
+verificar automaticamente todas as assinaturas DKIM e patatt que encontrar,
+por exemplo::
+
+    $ b4 am 20220720205013.890942-1-broonie@kernel.org
+    [...]
+    Checking attestation on all messages, may take a moment...
+    ---
+      ✓ [PATCH v1 1/3] kselftest/arm64: Correct buffer allocation for SVE Z registers
+      ✓ [PATCH v1 2/3] arm64/sve: Document our actual ABI for clearing registers on syscall
+      ✓ [PATCH v1 3/3] kselftest/arm64: Enforce actual ABI for SVE syscalls
+      ---
+      ✓ Signed: openpgp/broonie@kernel.org
+      ✓ Signed: DKIM/kernel.org
+
+.. note::
+
+    O patatt e o b4 ainda estão em desenvolvimento ativo e você deve consultar
+    a documentação mais recente desses projetos para quaisquer recursos novos
+    ou atualizados.
+
+Como verificar identidades de desenvolvedores do kernel
+=======================================================
+
+Assinar tags e commits é simples, mas como verificar se a chave usada para
+assinar algo pertence ao desenvolvedor real do kernel e não a um impostor
+mal-intencionado?
+
+Configurar a recuperação automática de chaves usando WKD e DANE
+---------------------------------------------------------------
+
+Se você ainda não possui uma vasta coleção de chaves públicas de outros
+desenvolvedores, pode dar um pontapé inicial em seu chaveiro confiando na
+autodescoberta e recuperação automática de chaves. O GnuPG pode se apoiar em
+outras tecnologias de confiança delegada, especificamente DNSSEC e TLS, para
+ajudá-lo se a perspectiva de começar sua própria teia de confiança (Web of Trust)
+do zero for muito desanimadora.
+
+Adicione o seguinte ao seu ``~/.gnupg/gpg.conf``::
+
+    auto-key-locate wkd,dane,local
+    auto-key-retrieve
+
+O DANE (DNS-Based Authentication of Named Entities) é um método para publicar
+chaves públicas no DNS e protegê-las usando zonas assinadas por DNSSEC. O WKD
+(Web Key Directory) é o método alternativo que usa consultas https para o mesmo
+propósito. Ao usar DANE ou WKD para buscar chaves públicas, o GnuPG validará o
+DNSSEC ou os certificados TLS, respectivamente, antes de adicionar as chaves
+públicas recuperadas automaticamente ao seu chaveiro local.
+
+O Kernel.org publica o WKD para todos os desenvolvedores que possuem contas
+kernel.org. Uma vez que você tenha as alterações acima em seu ``gpg.conf``, você
+poderá recuperar automaticamente as chaves de Linus Torvalds e Greg
+Kroah-Hartman (caso ainda não as tenha)::
+
+    $ gpg --locate-keys torvalds@kernel.org gregkh@kernel.org
+
+Se você tem uma conta kernel.org, deve `adicionar o UID do kernel.org à sua chave (pt)`_
+para tornar o WKD mais útil para outros desenvolvedores do kernel.
+
+.. _`adicionar o UID do kernel.org à sua chave (pt)`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
+
+Web of Trust (WOT) vs. Trust on First Use (TOFU)
+------------------------------------------------
+
+O PGP incorpora um mecanismo de delegação de confiança conhecido como "Teia de
+Confiança" (Web of Trust - WOT). Em sua essência, trata-se de uma tentativa de
+substituir a necessidade de Autoridades de Certificação centralizadas do mundo
+HTTPS/TLS. Em vez de vários fabricantes de software ditarem quem deve ser sua
+entidade certificadora de confiança, o PGP deixa essa responsabilidade para cada
+usuário.
+
+Infelizmente, pouquíssimas pessoas entendem como a Teia de Confiança funciona.
+Embora ainda seja uma parte importante da especificação OpenPGP, as versões
+recentes do GnuPG (2.2 e superiores) implementaram um mecanismo alternativo
+chamado "Confiança no Primeiro Uso" (Trust on First Use - TOFU). Você pode
+pensar no TOFU como "a abordagem de confiança estilo SSH". Com o SSH, na primeira
+vez que você se conecta a um sistema remoto, o fingerprint da chave dele é
+gravado e lembrado. Se a chave mudar no futuro, o cliente SSH o alertará e se
+recusará a conectar, forçando-o a tomar uma decisão sobre confiar ou não na
+chave alterada. Da mesma forma, na primeira vez que você importa a chave PGP de
+alguém, assume-se que ela é válida. Se em algum momento no futuro o GnuPG se
+deparar com outra chave com a mesma identidade, tanto a chave importada
+anteriormente quanto a nova chave serão marcadas para verificação, e você
+precisará descobrir manualmente qual delas manter.
+
+Recomendamos que você use o modelo de confiança combinado TOFU+PGP (que é o novo
+padrão no GnuPG v2). Para configurá-lo, adicione (ou modifique) a configuração
+``trust-model`` em ``~/.gnupg/gpg.conf``::
+
+    trust-model tofu+pgp
+
+Usando o repositório Web of Trust do kernel.org
+-----------------------------------------------
+
+O kernel.org mantém um repositório git com as chaves públicas dos
+desenvolvedores como um substituto para as redes de servidores de chaves
+(keyservers) que ficaram em grande parte inativas nos últimos anos. A
+documentação completa sobre como configurar esse repositório como sua fonte de
+chaves públicas pode ser encontrada aqui:
+
+- `Chaveiro PGP de desenvolvedores do Kernel (pt)`_
+
+Se você é um desenvolvedor do kernel, considere enviar sua chave para inclusão
+nesse chaveiro.
+
+.. _`Chaveiro PGP de desenvolvedores do Kernel (pt)`: https://korg.docs.kernel.org/pgpkeys.html
-- 
2.47.3

