Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C395434166B
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883844; cv=none; b=nxqf77dPn9PLBEQF4t4vA/Lr88C6nXDVnoZgKiAbnz2jxZjhggETt5iOCApBD5QhU1pHOiTSad7DMd/PzCoVxJPVvlnRd5GqEYGrHgUAahdbDQ+RHtDusVQaWc3Xe5aE8Fu4WSN1/l4iKWm1xDBzsBxC07MLyzLbF+XaoXwL+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883844; c=relaxed/simple;
	bh=QMKxWdTh5e+2/lSCw7OlzcqQctceKv/Ta25Nn96KSWE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qEYj9nIiAXQWBESvdsTMWGHzXAhgHM9bK5lWmi5nlewJN/5Tdzv8uY4p4jG1gzB/VfKlx3dcqw8INVkI2KMKmgihmjH/PvbRZIHougv3ZfTWMRKsjkzf+UxKRw4EahV4/iVwTAH6fzP6kOkoK4ZfawXv9bxw1vHnvBja59i529o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h2XB+Wv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h2XB+Wv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7188EC4CEF7;
	Mon, 30 Mar 2026 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774883844;
	bh=QMKxWdTh5e+2/lSCw7OlzcqQctceKv/Ta25Nn96KSWE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=h2XB+Wv7EnpiwYeCShpiXXh33tSKx9jbnq3v7EMz0TgW3UTaKZTtEw95ijfE+xIq9
	 sf9uXu+VEYbynNUdQ4OSIeq6T8YNcXr7nPV+lsnFOaNLDhppznGRvKwiKxA5qhp/Ic
	 P1ZqhMuZ9X8W6aWl0rVHOwpTd3/5TTUvoh53kXX0=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 5/5] docs: pt_BR: complete PGP guide translation
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
In-Reply-To: <20260329165041.831369-6-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-6-danielmaraboo@gmail.com>
Date: Mon, 30 Mar 2026 11:17:19 -0400
Message-Id: <177488383995.1817745.4339812333811008887.b4-review@b4>
X-Mailer: b4 0.16-dev-5738b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774883842; l=1799;
 i=konstantin@linuxfoundation.org; s=20260105; h=from:subject:message-id;
 bh=QMKxWdTh5e+2/lSCw7OlzcqQctceKv/Ta25Nn96KSWE=;
 b=Haen/W5LZ8fMcPdibiy273PEX2eKXEN2vQ01ak/vRTYqepbhg7OtRvNCO99HSMjA6v1vJELNu
 PVEZU6ysuptBIeoOxa5/2zuG/SieITnt4c7/ACiLE4QhzhswzUHRNVr
X-Developer-Key: i=konstantin@linuxfoundation.org; a=ed25519;
 pk=vcENxA6AQz/AmPXVH3DSZUftK7lCXJz/mUonEPEcInI=

On Sun, 29 Mar 2026 13:50:39 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
> diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> index 3501756fda52..fd19fd4c9eda 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> @@ -778,3 +778,136 @@ criptográfica nos cabeçalhos das mensagens (estilo DKIM):
> [ ... skip 46 lines ... ]
> +    O patatt e o b4 ainda estão em desenvolvimento ativo e você deve consultar
> +    a documentação mais recente desses projetos para quaisquer recursos novos
> +    ou atualizados.
> +
> +Como verificar identidades de desenvolvedores do kernel
> +=======================================================

Needs the _kernel_identities_pt: label here as well.

> [ ... skip 22 lines ... ]
> +(Web Key Directory) é o método alternativo que usa consultas https para o mesmo
> +propósito. Ao usar DANE ou WKD para buscar chaves públicas, o GnuPG validará o
> +DNSSEC ou os certificados TLS, respectivamente, antes de adicionar as chaves
> +públicas recuperadas automaticamente ao seu chaveiro local.
> +
> +O Kernel.org publica o WKD para todos os desenvolvedores que possuem contas

I think just "O kernel.org" without capital K.

> [ ... skip 50 lines ... ]
> +- `Chaveiro PGP de desenvolvedores do Kernel (pt)`_
> +
> +Se você é um desenvolvedor do kernel, considere enviar sua chave para inclusão
> +nesse chaveiro.
> +
> +.. _`Chaveiro PGP de desenvolvedores do Kernel (pt)`: https://korg.docs.kernel.org/pgpkeys.html

I suggest you switch all (pt) disambiguated links to just anonymous 
hyperlinks.

-- 
KR

