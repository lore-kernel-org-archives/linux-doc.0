Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AE933FE09
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883844; cv=none; b=TG5bJCwrPwM4uLXswR2bq/3upOdUOAJml0pDQIIwqH14MduksXg8p4ltmaRnEIso+V5i9DkbMa8LLRpru/hwCwBL9/IcLdlCpXGRikQe09zi+WpLF177XhYrI6tIQoKvH2JkG93vsro5QVtwIu3TDVw6hSQPNfT43VzhYBAMJtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883844; c=relaxed/simple;
	bh=Q6kmljJvtHq4shbXV9m4UdRFJi9jHNiLYw1Ih48O2cY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qznRUPmBVO/3b065DGeOdhnBJHzsrWc94Y4A+Rj8XWut4HllfqTRRsNd6PildCzGQ8N6fYSAcVldSHBqygTtzgSzGSpXWuMy5gn3OVs5JrIULswbDzTs5xB507P3qtmbjJ5dyemaeC/DSag33c5jpEr5GBjFfBTuQzw4dcCSC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pon47z4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pon47z4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05746C2BCB3;
	Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774883844;
	bh=Q6kmljJvtHq4shbXV9m4UdRFJi9jHNiLYw1Ih48O2cY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Pon47z4Imjio8s+PzWy2xu/vwlvg63fnyLbbvHZrOJc3n7g2uGK3AR62+SChh9TI5
	 axGHkqdPjiP6gj9y6gdhEKsevHvj7WaE9Zfq0y5J2qqTlAZ+hx1gVDBqb2GcbSMzz2
	 IBLf/NPnO6uOPM8o9KHSfWYgF/BDBkhRQhBLydns=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 4/5] docs: pt_BR: continue PGP guide: Git and
 maintenance
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
In-Reply-To: <20260329165041.831369-5-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-5-danielmaraboo@gmail.com>
Date: Mon, 30 Mar 2026 11:17:19 -0400
Message-Id: <177488383993.1817745.96378113199631042.b4-review@b4>
X-Mailer: b4 0.16-dev-5738b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774883842; l=3852;
 i=konstantin@linuxfoundation.org; s=20260105; h=from:subject:message-id;
 bh=Q6kmljJvtHq4shbXV9m4UdRFJi9jHNiLYw1Ih48O2cY=;
 b=BaY1SDeoqEGLJTi78UxL2kBC85gyZybMPtS8yfhi2khOU15n8EgsDorWDMekEhyPiaq/dkrmc
 XvtI7XD+ksyAD8+HwZip/B7cYpxJKIO3vAxq/hCZWhp5X3PxmVZ0V2E
X-Developer-Key: i=konstantin@linuxfoundation.org; a=ed25519;
 pk=vcENxA6AQz/AmPXVH3DSZUftK7lCXJz/mUonEPEcInI=

On Sun, 29 Mar 2026 13:50:38 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
> diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> index f7b31201499a..3501756fda52 100644
> --- a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> @@ -489,3 +489,292 @@ maioria das operações::
>  Usar ``--edit-key`` nos coloca no modo de menu novamente, e você notará que a
>  listagem das chaves é um pouco diferente. De aqui em diante, todos os comandos
>  são feitos de dentro deste modo de menu, conforme indicado por ``gpg>``.
> +
> +Primeiro, vamos selecionar a chave que colocaremos no cartão -- você faz isso
> +digitando ``key 1`` (é a primeira na listagem, a subchave **[E]**)::
> +
> +    gpg> key 1
> +
> +Na saída, você deverá ver agora ``ssb*`` na chave **[E]**. O ``*`` indica qual
> +chave está atualmente "selecionada". Ele funciona como uma *alternância*
> +(toggle), o que significa que se você digitar ``key 1`` novamente, o ``*``

If we have to add (toggle) here, I don't think we're properly explaining 
what this does. The idea I had was to compare this to a physical switch 
that one can toggle from one position to another, so maybe a better 
translation here would be to use something like "Ele funciona como um 
interruptor" or "botão liga/desliga"? Up to you, though.

> +desaparecerá e a chave não estará mais selecionada.
> +
> +Agora, vamos mover essa chave para o smartcard::
> +
> +    gpg> keytocard
> +    Please select where to store the key:
> +       (2) Encryption key
> +    Your selection? 2
> +
> +Como é a nossa chave **[E]**, faz sentido colocá-la no slot de Criptografia
> +(Encryption). Quando você enviar sua seleção, será solicitada primeiro a frase

"Quando você confirmar" would be better? (Oh, and Portuguese always 
trips me up with its future subjunctive looking identical to its 
indefinite -- my French speaking part of the brain is so confused).

> [ ... skip 126 lines ... ]
> +servidor sshd na extremidade remota.
> +
> +.. _`Encaminhamento de Agent sobre SSH (pt)`: https://wiki.gnupg.org/AgentForwarding
> +
> +Usando PGP com Git
> +==================

Same thing here, needs a .._pgp_with_git_pt: label.

> +
> +Uma das principais características do Git é sua natureza descentralizada --
> +uma vez que um repositório é clonado em seu sistema, você tem o histórico
> +completo do projeto, incluindo todas as suas tags, commits e branches. No
> +entanto, com centenas de repositórios clonados por aí, como alguém verifica
> +se sua cópia do linux.git não foi adulterada por um terceiro mal-intencionado?
> +
> +Ou o que acontece se um código malicioso for descoberto no kernel e a linha
> +"Author" no commit disser que foi feito por você, enquanto você tem certeza
> +de que `não teve relação com isso (pt)`_?

Same here, just use an anonymous inline hyperlink to avoid having to 
add (pt).

> [ ... skip 32 lines ... ]
> +
> +Para verificar uma tag assinada, use o comando ``verify-tag``::
> +
> +    $ git verify-tag [tagname]
> +
> +Se você estiver baixando (pulling) uma tag de outro fork do repositório do

I would just use: Se você fizer um git pull

This avoids having to add (pulling) in parens to explain "baixando".

> [ ... skip 83 lines ... ]
> +kernel.org criou para este fim, que coloca assinaturas de atestação
> +criptográfica nos cabeçalhos das mensagens (estilo DKIM):
> +
> +- `Atestação de Patch Patatt (pt)`_
> +
> +.. _`Atestação de Patch Patatt (pt)`: https://pypi.org/project/patatt/

Same here -- just use an anonymous inline hyperlink.

-- 
KR

