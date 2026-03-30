Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE933FE09
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883844; cv=none; b=MPGSFMc0TND+Wmk4elzYK0iJoKJhU8DDL94NYl3yammjn/DXxLQXGCvjlKjVRNbp0u6feoUr4yhoPVH4qsmMdaXiOdQfcns1B+bq58qMjqwkdP1arSJyl5GIjNCOMZkZRv9w5ppmrWIXXpkJCmyo8VZ9QeTCZrp9zH50kRaxLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883844; c=relaxed/simple;
	bh=OWlFttQ/yqiN+3z3z+6Q1ubbICbGciUa63y+9JRjPYM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=P+Jfnee30xkZjkrnMpQsv4pHHRL7xnmBcpAAgN+qcatclM+3ukPmwunIuj7dX9fU+Cvm7Y2lYhkl29a5c62rMMbWYCnQQLDC3qVTNG8bJ/nT3sv73mbxGbSDuTxH8JaSZSf0uCAhVXlOcQHgdK3K30BcbG5ThwwfVBTgOc/nIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lZdT4FAX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lZdT4FAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AADDC19423;
	Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774883843;
	bh=OWlFttQ/yqiN+3z3z+6Q1ubbICbGciUa63y+9JRjPYM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=lZdT4FAXKlkrzLvLhAsT8N9nNo2wP8ZgOnYicyfy6mAmW2J51gzx8LHLhPay3ypu/
	 tlkYKUoDVtqpgiPDEv7RGzy2dKmlWV206gQzGkC3bzf8EaKPzCeWVwJ5SaN59c6ohb
	 e2mVUTDdD0yCK9dbg9oavkk67zEQny1JGeT60DlA=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 3/5] docs: pt_BR: continue PGP guide translation
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
In-Reply-To: <20260329165041.831369-4-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-4-danielmaraboo@gmail.com>
Date: Mon, 30 Mar 2026 11:17:19 -0400
Message-Id: <177488383992.1817745.6595454759376079201.b4-review@b4>
X-Mailer: b4 0.16-dev-5738b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774883842; l=3224;
 i=konstantin@linuxfoundation.org; s=20260105; h=from:subject:message-id;
 bh=OWlFttQ/yqiN+3z3z+6Q1ubbICbGciUa63y+9JRjPYM=;
 b=tO2xBWoNKR5RO8fdvzuVBU3RCI+IkvlFzshxBn8S2pWnFgPcNejOBHVOnaSdujyxC1Es+6V1k
 vBDiZOb9IekADk9MdmA4gKpEyalU1hBuc7ZAEyR5gudJwii7WfSIvJA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=ed25519;
 pk=vcENxA6AQz/AmPXVH3DSZUftK7lCXJz/mUonEPEcInI=

On Sun, 29 Mar 2026 13:50:37 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
> diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> index 93f0759e94b2..f7b31201499a 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> @@ -200,3 +200,292 @@ offline; portanto, se você tiver apenas uma chave **[SC]** combinada, você dev
> [ ... skip 23 lines ... ]
> +está criptografada com essa frase secreta e, se você algum dia alterá-la, você
> +não se lembrará de qual era quando criou o backup -- *garantido*.
> +
> +Coloque a cópia impressa resultante e a frase secreta escrita à mão em um
> +envelope e guarde-os em um local seguro e bem protegido, de preferência longe
> +de sua casa, como o cofre de um banco.

I'm okay if you change it if the recommendation to store the backup in a 
bank deposit box isn't really useful for non-North-American locations.

> [ ... skip 56 lines ... ]
> +  de PDF, etc.)
> +- por meio de coação ao cruzar fronteiras internacionais
> +
> +Proteger sua chave com uma boa frase secreta ajuda muito a reduzir o risco
> +de qualquer um dos itens acima, mas as frases secretas podem ser descobertas
> +por meio de keyloggers, shoulder-surfing (observação direta) ou qualquer número

I think "observação clandestina" would work better than "direta" here.

> [ ... skip 63 lines ... ]
> +
> +Assim que concluir isso, certifique-se de excluir o arquivo ``secring.gpg``
> +obsoleto, que ainda contém suas chaves privadas.
> +
> +Mova as subchaves para um dispositivo criptográfico dedicado
> +============================================================

I think this needs a  _smartcards_pt: label before this section. The 
commit message says this label exists, but it is not present in the 
patch.

> [ ... skip 30 lines ... ]
> +
> +A menos que todos os seus laptops e estações de trabalho tenham leitores de
> +smartcard, o mais fácil é obter um dispositivo USB especializado que implemente
> +a funcionalidade de smartcard. Existem várias opções disponíveis:
> +
> +- `Nitrokey Start (pt)`_: Hardware aberto e Software Livre, baseado no `Gnuk_pt`_ da FSI

I think (pt) here would be confusing to readers, because this implies 
that if they follow the link, the site will be in Portuguese. There's 
also an inconsistency with `Gnuk_pt` here. I think a better strategy is 
to use inline anonymous hyperlinks like:

- `Nitrokey Start <https://www.nitrokey.com/products/nitrokeys>`__: 
  Hardware aberto e ...

This should avoid clashing with the English version and not create 
confusion for readers.

> [ ... skip 22 lines ... ]
> +.. _`se qualifica para um Nitrokey Start gratuito`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
> +
> +Configure seu dispositivo smartcard
> +-----------------------------------
> +
> +Seu dispositivo smartcard deve simplesmente funcionar (Just Work - TM) no

Does the "Just Work TM" joke still make sense in the translation? :)

-- 
KR

