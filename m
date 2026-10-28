Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174679;
	b=FUhFAet3oKjvmeFnH1Q1Qu8KgcAIrZbXKXxTmU882g6mlneeUwhcUIswgYwr/1bAnWFo
	 5rm3xsGvnT+inQmsmV8W0phZP7/YmzvYp5eKa2v7ccEbEmpvYlnkH7JvaRbWaF1XxZYZA
	 AqPhx6afTmXEOSKkr/QzZ7DQpapMYZwUk/ExysObAEsfnEl1gZexGWBOCrAIB3WFAPzU5
	 GRT2vtR9LD+1hWSLW7haRYn93CvlVAXwyFGkQF4SVWBSNiSS5fg4pTxVEVQjpTWzlfYQZ
	 TcGTqDhdJembC1/JeH/w4jbS/YymmCP05+btbS4QKxfFiIODaBH5wiWPyohh9PaEang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174679;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=r40AGc2HV5Phw46UNoMLkUuwsJc6KtksK+EPVQ4gjzA=;
	b=0+0n+NjwO2e1sudBrzNgD6n5rwD96jdHC4/9aCSCIflbJK2W31el2lV6acDXyRdL36R8
	 YuflPnpECIPjXdC1CkmiyngM+sq8a2Hf5WuVEZvnC15RLPi+0D/I0tyEcn4em15shl6iZ
	 yZ8kdqK2rul9A8+M5m+JVuA7OEd5PARaDGMI9VJdXJOzAK6fAlCRCadDpiT44dYNrYFwn
	 sgT1psD+nrrQQ9zr1qEzNTkyetvbZB4kv2jOpmFvmechDISCr5vsaWp/a4a4lpOeRX84v
	 rlFavRPHG8TmsLSziS+1CyEn6lLU9+kjQI695Lvore4Go9/jvvt6WA+DJI/NPW4zY4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA22606A32D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA22606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u1Y8KdRrWAv9eIpRyra/9RFWCZ/RbIdOt3vtgFGgx2Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793174676; v=1; x=1793779476;
 b=dr/OfbPAQ8JFAyMgt4wx8iOppKu8QXoQYok1zfHQKnC2KJdPHT98zZezeTh85WitWMNPcRHl
 1zrVNBu4LGxfyQZS8Lolj9Z+bcqyTJQP1ORI7Lpgy4Tx9ZOo0nzFFxTJGeZNAuOq7gZ4iKEqX54
 MSb/7x5IETI9Casb/kCwXkIZL8Cv4tkMtCh6SUwcoH9FC/7kUCkM6OEnkDrAX0yr61YY8r1o/B/
 4Z5tEO/tErqD9uYYwrhT8C+LgLgWClA3O1S/hI4Au8U80L24tpOgiLwy2U2zxryD0Uocyb7Q3L8
 K4QeybYK74FAnUoXCZrntnJNjUtAPe+hdPplAzIMTy5Zg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 935c37095ecf4d61;
	Wed, 28 Oct 2026 08:04:36 +0000
X-Mizu-Trace-ID: 935c37095ecf4d61
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 16:04:27 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] docs/zh_CN: reorganize process debugging guides
Message-ID: <auGsi1N37Ptp7Kqg@wyuan.org>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <20261028034134.4144660-5-dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028034134.4144660-5-dzm91@hust.edu.cn>

On Wed, Oct 28, 2026 at 11:41:29AM +0800, Dongliang Mu wrote:
> Move the GDB debugging translation into process/debugging. Update the
> process and development tools indexes to match the current English
> structure.
> 
> Synchronize the process index with upstream revision a03ef333fbd6.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  .../translations/zh_CN/dev-tools/index.rst    |  37 +++---
>  .../debugging}/gdb-kernel-debugging.rst       |  15 ++-
>  .../zh_CN/process/debugging/index.rst         |  62 ++++++++++
>  .../translations/zh_CN/process/index.rst      | 111 +++++++++++-------
>  4 files changed, 160 insertions(+), 65 deletions(-)
>  rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
>  create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst

[...]

>  ============
>  内核开发工具
>  ============
>  
> -本文档是有关内核开发工具文档的合集。
> -目前这些文档已经整理在一起，不需要再花费额外的精力。
> -欢迎任何补丁。
> +本文档收集了用于内核开发的工具文档。目前这些文档只是汇集在一起，尚未充分整理成一份连贯的指南；欢迎提交补丁！
>  
> -有关测试专用工具的简要概述，参见
> -Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +测试工具的简要概述见 ``Documentation/dev-tools/testing-overview.rst``。
> +
> +调试专用工具见 ``Documentation/process/debugging/index.rst``。
>  
>  .. toctree::
>     :caption: 目录
> @@ -21,21 +19,26 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>     testing-overview
>     sparse
>     kcov
> -   kcsan
> -   kmsan
>     gcov
>     kasan
> +   kmsan
>     ubsan
>     kmemleak
> -   gdb-kernel-debugging
> +   kcsan
>  
>  Todolist:
>  
> - - checkpatch
> - - coccinelle
> - - kfence
> - - kgdb
> - - kselftest
> - - kunit/index
> - - ktap
> - - checkuapi
> +* checkpatch
> +* clang-format
> +* coccinelle
> +* context-analysis
> +* lkmm/index
> +* kfence
> +* kselftest
> +* kunit/index
> +* ktap
> +* checkuapi
> +* gpio-sloppy-logic-analyzer
> +* autofdo
> +* propeller
> +* container

+ cc Chen-Yu

My b4 review agent scanner says..

| OpenAI Codex <codex@openai.com>:
| 
| The move leaves Documentation/translations/zh_TW/admin-guide/README.rst
| (line 289) pointing readers to the deleted
| Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst.
| Please update that reference too, either to the new zh_CN path or to the
| existing zh_TW/process/debugging/gdb-kernel-debugging.rst translation,
| so readers can still locate the debugging guide.

Seems to be a good finding :-)

Thanks.
