Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1005F33998
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776605538; cv=none; b=FIZnpO6cp0RvrFsBkovp+sK42LjcqeVvo6Y3GzjB52AQE3AsbKUQhsHeVIcvQeypaVe211peKMK9QsT68fXlKyF6W/PgNHDdOVGGv0vxwozpTPpGj/T7bye4LZFY5xjrslmzYuaq0QMdDOsISkFKkKOxHrXasj27LwFbEBoj7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776605538; c=relaxed/simple;
	bh=Ip0d5DBUyVPoheUjyQr7rQwV+qiRzFMzu6K11BbxV18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R3uXC1euoyP4JO3SQqX33q6kNFwpNiK+zp882MjzKBeNEDp2rYRS//vqppfCzM7i/cK/yb4DYcpDIuFmMz9HWcn6ErRtxrMa30vbGqT5hEN/FiL9nbRg/Y8c2ncP1KBjucNzRihkCVeQKyyT4EZrWbhzcuaKWrvxirUHC4bS8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F29PskMG; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F29PskMG"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so1217096a91.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776605535; x=1777210335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3DpD3/Bkr5HjkEtcV7j+/UczsLnwKJAPJ6W22c8oNg=;
        b=F29PskMGj4eQzTgN20iO9LcseuPyHzLs9b7IxnP3iy2R7ZMqR/0gy/ZgLMqvPhfHLa
         6glJp2gEnL7IQwhEuDr5ACSojJniuKMEGB984etacVgMNcoWEu+PArMFXrqpaN6KC62R
         +xsVHchF+aGIsiwrjNCqgET8rpxJ7DeYhLa8J+DKqB/U1vo+Zz0kWakUVIhjKc1AVoko
         DGcfM+468KRRv2qu0c8OKP/dPybIR5zzFeUgnFPqpANVcKxbTU9WVL6d9rtjHR3zXiEG
         3+JK1EAWtLVImakMmlDOhJOIwDUGkhuHpS8OOAdTkD5dJqINkMZKYgtpCCHf02XB4tB0
         ZpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776605535; x=1777210335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3DpD3/Bkr5HjkEtcV7j+/UczsLnwKJAPJ6W22c8oNg=;
        b=PkeYdA+FfkoQJc6s/alP2FMFvugJU9lwGbb7znuetHP8qbRAEIYxRMMku/rXolsbo/
         r5NnSRuLDrcVeY/dDz3Po4cYySCpU+LTwVww1KEgiqkiGv50Cyt3KJCoC1eqljpMJNKK
         i3Aok8ucUF6mmBqqXnfKaEYAOB9/OHeyNw+2xYrr4E6MRe5AiHNPVo9k20ghCJ3+0wFX
         1u1T0eVE4nfBEANKip1v5moYBely+Fv2mS6Xa026FfIAJLfu0Ivmu2oXc6cwnyvpYy4K
         hiwNYzS64kSO4xxNEENEgYuE6MMdusmKK5RwQGObjYWR9cqibYQOM9W6WKekyu+GVGUZ
         FSmQ==
X-Gm-Message-State: AOJu0Yzhowf2TRA1155iNL3X1jP8hBuj0fY4ZxHmlaM6peVzq5ojc51K
	IPKywmCi6aKdkyRUG3yguHBn02W7idNCpolLhWTfO4CdreL+W74g7ph6
X-Gm-Gg: AeBDiesanYvcsvii/nwAJ1BsquXwDTEqouX7jbVGf7SrpGgnJVOdCUSQMdfbJiZrx97
	pZThxpbnXzFS5FCzUXyzV1xi1P36XqYMMqtkXOhSqXYirDYkkCkvITIPXSCk2dCW0mynk9rZmRE
	iiXnY0DemZsSvSZ+nyfQVHRLCT3O/DhNXV0tnErAvru1QkHvXZ6qhnmEnqrHOAX7tRf4Xkai6qh
	hs11DZEk88fO2QZW3mDSfwxxUf5YZPHf6Uy0oadGzgdPk0cqogMyJkVOApr/nk5l1ftUm/zdAjI
	/LF06IJZXUF6giH36NpvyKHHd4FjVTDrXfGsyKNBTVrCSJY5v3MJprr2sLG8cUqIGbGX0swbyfD
	0tPm+loCxGf7a8Z4tCHdMb1FR+8lPVfu8JkqZNyuHVKzRN+Na9YKQZOZkBVgx8+deMpMVJpnwDP
	zq8VwhTvL54a79IqEsrGFpT7ePydxS1nRfWrUKB/QsueVFgQ0WLyYEy3qdaX40KisfNnhbraYbJ
	00=
X-Received: by 2002:a17:90a:e7d0:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-361404945e0mr11011086a91.23.1776605535354;
        Sun, 19 Apr 2026 06:32:15 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc01:3499:eb40:121b:8539? ([240e:38b:d99:bc01:3499:eb40:121b:8539])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff90dsm73698045ad.11.2026.04.19.06.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 06:32:14 -0700 (PDT)
Message-ID: <74d5a331-9b44-43ae-90a6-8099b65f4845@gmail.com>
Date: Sun, 19 Apr 2026 21:32:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add --no-merges to git log example in
 how-to.rst
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <20260416042647.3646595-1-ben.guo@openatom.club>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20260416042647.3646595-1-ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied thanks!

On 2026/4/16 12:26, Ben Guo wrote:
> Add --no-merges flag to prevent referencing merge commits in the
> through-commit field of translation commit messages.
> 
> Signed-off-by: Ben Guo<ben.guo@openatom.club>
> ---
>   Documentation/translations/zh_CN/how-to.rst | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 7ae5d876588..39ed7054fa3 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -257,7 +257,9 @@ Git 和邮箱配置
>   
>   	Update the translation through commit b080e52110ea
>   	("docs: update self-protection __ro_after_init status")
> -	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容
> +	# 请执行 git log --no-merges --oneline <您翻译的英文文档路径>
> +	# 并替换上述内容。注意：应引用实际修改文件内容的 commit，
> +	# 而非 merge commit
>   
>   	Signed-off-by: Yanteng Si<si.yanteng@linux.dev>
>   	# 如果您前面的步骤正确执行，该行会自动显示，否则请检查 gitconfig 文件
> -- 2.53.0

