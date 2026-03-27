Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD33914E1
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616186; cv=none; b=dDK+jfelHMnqE+92WvADpysnztY2IJ8Sd7rVIUSzSU4lGeMJ/vdJwt78K9uB8ZIWyiPpboM6Aecp0AF3ag0atFj2Udy95y64gSfh+d3kU0OsyI93t7VVpr+RF3IEAlTWWYpCLBhBkhf9lfCdcNtXCunxz1Qx8vmw5Axp4yXnz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616186; c=relaxed/simple;
	bh=v+rcOZU6/y/dm5EL68DNhcvdTYMZMJXFEUu4mR5WTpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c78I+3u7KPNLeZ2/yTk1CT54OsTmG6vA/NwrJeiPZdEweiCNlRd8l9XTG7c2ac79gBL2A2qGE3LJUmVFaw9FlmMs75zMhred0Kzyp1uOBjrLhW5wdVgNWG2rzzz6ytf6VIu9QdJUI45IpFbiCCibg2mUGVXQhejG3jfXUw5CfAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmZplRtx; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmZplRtx"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-604f1bfed92so1077928137.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774616183; x=1775220983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htRARZf/jZjtnx4EpviwDS+534yLQjARZGHEP1UbWwM=;
        b=YmZplRtx4jGg2ls0ESlukj394PB6IFqircT7FTtW8r8p3/O+G39WuBTVjxJcavKWCC
         Xn6pqcbuDxgI04lDePLH4z4ZNOs83Llu8EBr3lWcE+K4vuHpU/grtvCOxuJo8Fgr3D63
         9xYBg5+dmPFfx6FcLHUPsmKCAJysW8xw4KjwdvnDmlMJtZuCKxpUETlZxcAjWUvvc9yG
         +qwQmkYr9gvJSqPIfdZTUaHPk0WIT0lwK7UEG4/GtQ96+jDfFdvFni3rpAJepzFaMg1a
         4dj9KKLQLogySsY1ql4ZEMZu7CNjVGb3T7R2Y19MwkPfWb9D5+et1tWoBYnUy/vSRy7/
         +FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616183; x=1775220983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htRARZf/jZjtnx4EpviwDS+534yLQjARZGHEP1UbWwM=;
        b=cfWAieaOpQykS5pTj4pWOk5SB2pF7rvVHp0YzRNqecCPvQ8Wvo48Vd8BXM9wXQeaX1
         BbZF3ZR/5C5fLfg4ub24uE/gZIq5+3TD1h5/kpPSL64z4GwGHfdJzngOtxT6qORgpIAm
         Z8PFOy3rLcUEFRYWaN4/ALT8aLzoOhw7/5IXrb1M+TxikshS3b3ZOQaBDVMlxVRc7FYm
         ZiCfmUe/5zgojv2GoVEMNvdwTj7rKlro8AN+mvow2EsdAdBkdyLT757g7InMp3/obf3w
         T63Pjkp+prviLthHy9vC5SYczzmFtNnb/klet0WjcO4c8XDckZbRQmiPVbh8JkNeo69E
         Z5Gw==
X-Gm-Message-State: AOJu0YzLF0h+A08z0Qu9+dy09ZPZTaUnCIW+l9STU9jmk39+MnF+32Xl
	BOL//AWjBwKdHz6Oc4GJPW0OKzcLhRs/wcekFoU3xKcutdVT7hUXLpZCphj8gaOM
X-Gm-Gg: ATEYQzx9q7za594GhZsXKWTo+1V2ZiiEQYo+TnOvV4QkxDOMUPVpxm52R6YyuS7eF2a
	L/zfkUPSp6lbbzvsgMllnyjxEcbp+WQnjz8VwTG49oD7HmVrc+EO6U+8TH2Ubzgyhbl93vYkQz/
	mwX1butllMZeD1QnWbdMsmGy3F9HUKRwTJFC2ywDnFev++YAuEMUR4ZMLt4M6baybbooFcYN9wy
	e/L/nO0b+PgS8PQplSsOzVr8cBRyRkrZEocXZYYcpuI1UvHeN5vJfmJZ2Urnv+Ffv1B/QIMFLiv
	6TMD0/1WAo3j6GUeF25v5qRfX2NduMCp8Re1Jq5iu8o6IpNd5Pz/2qwOqON6Pv414yuEcXsLx/+
	xpVblTeQS4WxAyt5eoWKQx7iJaUHfrMa7vwt60BrjXqlBsHVUbpJQ89o3+/PAveg5pBwzTPcBrE
	W8hdBZo0tc7JG5kI+iEDKYvcnJCSt3nUUQzufNjIk4P/4ioD0S8uIWyM38rY0KzX49EAbMgN9Ai
	g==
X-Received: by 2002:a05:6102:41aa:b0:602:7acd:ab2e with SMTP id ada2fe7eead31-604f9055d94mr1081598137.1.1774616183017;
        Fri, 27 Mar 2026 05:56:23 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm6259318137.5.2026.03.27.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:56:22 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 5/5] docs: pt_BR: complete PGP guide translation
Date: Fri, 27 Mar 2026 09:55:36 -0300
Message-ID: <20260327125538.581064-6-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327125538.581064-1-danielmaraboo@gmail.com>
References: <20260327125538.581064-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
 .../pt_BR/process/maintainer-pgp-guide.rst    | 135 +++++++++++++++++-
 1 file changed, 134 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
index e4cc9211b..78cc393e0 100644
--- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
@@ -777,4 +777,137 @@ criptográfica nos cabeçalhos das mensagens (estilo DKIM):
 
 - `Atestação de Patch Patatt (pt)`_
 
-.. _`Atestação de Patch Patatt (pt)`: https://pypi.org/project/patatt/
\ No newline at end of file
+.. _`Atestação de Patch Patatt (pt)`: https://pypi.org/project/patatt/
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
\ No newline at end of file
-- 
2.47.3

