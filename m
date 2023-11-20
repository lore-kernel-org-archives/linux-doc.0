Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374D374CF
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aH2ZZ1oI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862CBC433C8;
	Mon, 20 Nov 2023 22:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700520682;
	bh=QhlFFc4RoRgIxP7kbsyeDLEROTz6LXQQJtDDhx5iLyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aH2ZZ1oIrGQMPJPhnyCHnyn3zTQ1KrnQLdy/JF/UnJgWVo/FxcFM97dlfxUhBI4E1
	 O6NTHMRimsURgwel0T1+VTo8uGCj0c/hQ3U0wfa4969TxPkY6BUDJhYtdKT4obHKEv
	 etHF24UtDuMYmmFyJnm18xEHU8V86ZEOA+90rarU=
Date: Mon, 20 Nov 2023 17:51:21 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: corbet@lwn.net, seakeel@gmail.com, alexs@kernel.org, bobwxc@email.cn, 
	wu.xiangcheng@linux.dev, yizhou.tang@shopee.com, linux-doc@vger.kernel.org, 
	chenhuacai@kernel.org
Subject: Re: [PATCH v1 1/3] docs/zh_CN: add process maintainer-pgp-guide
 tanslation
Message-ID: <20231120-quaint-inquisitive-horse-abc364@nitro>
References: <cover.1700474235.git.siyanteng@loongson.cn>
 <7c7f24f653468c9a2c7e3909a7a390ea36eec879.1700474235.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c7f24f653468c9a2c7e3909a7a390ea36eec879.1700474235.git.siyanteng@loongson.cn>

On Mon, Nov 20, 2023 at 06:02:23PM +0800, Yanteng Si wrote:
> Translate process/maintainer-pgp-guide.rst into Chinese.

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(With the help of Google translate, 因为我已经有很多年没能读懂中文了。;)

-K
