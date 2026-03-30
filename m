Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284033FE09
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883843; cv=none; b=H9VfU6h/BOhbF8Nkl3SumwzBBof/DeDu5cZv3czNEp3AqIfQuHMxILltrbnxcXXNteDdtGz4PDn3rwYujRYIue+u45YmtHHSb3or02cY4utbvS5uRdlzH5O5z8ZFW5sKZUC6Eznpf4/kZ/Z+obM6OlI0LAXL7mFka1N0zMnSG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883843; c=relaxed/simple;
	bh=V16AHQxokH4fAW+SeFtoiG2+SJqo6TmL8DougIZXlus=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DRj4clRu32zyhkdP0tz8z6QTRmUxIYiPt03uk+9tJTrKUU7K5IV+rHlK0lGD4bGYiJSNyI4Ncv4f/JAajDUU+ixxYiF7Rw1Cn6G5VYUMAnlNLJqwBmtRmPdgOz6dCGoJq/R0QZJv0M8yuMEAbzGllqDwtNCrCIUu+g0gHQBOdUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Od2QrE46; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Od2QrE46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC70C4CEF7;
	Mon, 30 Mar 2026 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774883843;
	bh=V16AHQxokH4fAW+SeFtoiG2+SJqo6TmL8DougIZXlus=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Od2QrE46c0Co2Kbu+DCljxLO713BTDBpiXct0DrMKKdmvr/5H1n5Fa/iUuYokkoP+
	 JWnbJwx8Py14+8SVrMfW1ajn+Qq6pomytJTEkz9c+M7TfvRjkYwhvGiDIH7ANCn2xP
	 DkfHu+Zij0U9wCx0dt30Q01zX8qmYig3u91Jb76Q=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 2/5] docs: pt_BR: start translation of the PGP
 maintainer guide
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
In-Reply-To: <20260329165041.831369-3-danielmaraboo@gmail.com>
References: <20260329165041.831369-1-danielmaraboo@gmail.com>
 <20260329165041.831369-3-danielmaraboo@gmail.com>
Date: Mon, 30 Mar 2026 11:17:19 -0400
Message-Id: <177488383990.1817745.13341460240426478773.b4-review@b4>
X-Mailer: b4 0.16-dev-5738b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774883842; l=1313;
 i=konstantin@linuxfoundation.org; s=20260105; h=from:subject:message-id;
 bh=V16AHQxokH4fAW+SeFtoiG2+SJqo6TmL8DougIZXlus=;
 b=LEHrew5wzWkGLhUCM2Ow8N1iGd0g2AeXugiHO9CehnukfFvxwxm3e4yLAaqcldOeuEqcym8kB
 NTcLpK2d70sBKNdWkwVP05O3lD89v74ekP34Dmw6ECCjm8zu1EwBv9m
X-Developer-Key: i=konstantin@linuxfoundation.org; a=ed25519;
 pk=vcENxA6AQz/AmPXVH3DSZUftK7lCXJz/mUonEPEcInI=

On Sun, 29 Mar 2026 13:50:36 -0300, Daniel Pereira <danielmaraboo@gmail.com> wrote:
> diff --git a/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> new file mode 100644
> index 000000000000..93f0759e94b2
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/maintainer-pgp-guide.rst
> @@ -0,0 +1,202 @@
> [ ... skip 26 lines ... ]
> +- Repositórios de fontes distribuídos (git)
> +- Arquivos tarballs por release
> +
> +Tanto os repositórios git quanto os tarballs carregam assinaturas PGP dos
> +desenvolvedores do kernel que criam os lançamentos oficiais. Essas assinaturas
> +oferecem uma garantia criptográfica de que as versões para download

The "para download" jumped out at me. Like I said, I'm not very well 
versed in pt_BR, but shouldn't this be "baixar"? Looking at other docs 
in the pt_BR translation, I think they use "baixar/baixando" there. I do 
realize that technical jargon is normal, though.

> [ ... skip 80 lines ... ]
> +
> +Você também deve criar uma nova chave se a sua atual for inferior a 2048
> +bits (RSA).
> +
> +Você também deve criar uma nova chave se a sua atual for inferior a 2048
> +bits (RSA).

Looks like this got duplicated.

-- 
KR

