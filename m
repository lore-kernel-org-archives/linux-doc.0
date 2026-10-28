Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174783;
	b=5VpnBc10M5KTxULebQIoKtCVlLmaIHD3deR0nLmG8JOvYhsJMVsy3J774qtlYGZxcbSV
	 89JYMhGeTjJu+zLpxFEsgoAUqsOpK4P2KVglt9Z7+iEmv0+vHA0+45BFssSvKR0LDyobW
	 6Zu+jkT4qF5dSegXm/X6NBen8UTomde4NpYeYVAK/tieChlRqEqehyGIbiRggbU3vlfKv
	 nk0ohI+mkF1wAC7MJZ2gnC/WlAOhSAcxSdFJl4ZuallGttrTseIYWMkJaPXPwSc8xzZqD
	 upSTmzHsYOuukj2bIZXZCJJ26WpP0rcY/F5S1aNuerh/v1Bi8unm5fmg+poQ6u0cqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174783;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uZIWeCagrmwaBpsKeIsFuArogqnWp9j9ZTU7YinTLsY=;
	b=j5hmWQG0r8s6TV9hX2SibdMU22l5bDJYluZ3Ko09K95MZgrPxLsdctWYHVDQAzhea8Fj
	 mGPm3tTgqmzMqZhJMC6uym4/B7MtwoPxCyVmOZIR7p59z8ScOwnaBaP+olj/cPO8c5tU5
	 QS/RMdGenvaEeltVagJ7jLDhh93T5VoPzYVH7bzLeFlzlncKJEzJtfxp9YPKWdpsLOAdx
	 EPq+mbZVM3WYorChccvxFouIMCGiuLbQuR1pRbCtuk7zVNZCWrzQLhCrKY1FruouZen7y
	 CZA5klzf5smpbbbVXb/LzF5lArMOQX0zydIZ2aGXRs+98Kyc+2P6JmqMUw8gM77utJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=bry2CQ0p;
	arc=none smtp.remote-ip=95.215.58.111
Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E27606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E27606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=bry2CQ0p
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9cfbiA0ky34n1lxGhHKsOxHGEDD/NxPfS/f0cKWP7wI=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793174780; v=1; x=1793779580;
 b=bry2CQ0p4OoxNflm/ewGyQMSCQsOfgIanVM59N8ix8f2RC0W9/Z5QorXm5C3zBS/PMhpuDph
 /vqBpXbtUODEcMXhBulSdoZ2UG05SKyKNb69t/NzYZ6LNe5yVMHuoWENexiaCLnH8RU4CoYbK33
 D8rrnRvIng6PLDex8+abQMtiYSaQSJMZmlOcfzaIClQjS33ZzmYHKTTiqpeHRZs829WG6gpTuir
 mUWal4CXwnDKlGhGhEMtrPRft+wI0dPNGCsHU4wdhxVEM62YyWb/ooKEvIWYSNqAuDi9FZO+HxS
 z0ytqz1did2nfsQZXNtW/Dj5wSciGOxbRdhAwIwn8Ovqg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b5c157013ac541d;
	Wed, 28 Oct 2026 08:06:20 +0000
X-Mizu-Trace-ID: 4b5c157013ac541d
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 16:06:11 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH v2 4/9] docs/zh_CN: reorganize process debugging guides
Message-ID: <auGs89xiNoacI5vi@wyuan.org>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <20261028034134.4144660-5-dzm91@hust.edu.cn>
 <auGsi1N37Ptp7Kqg@wyuan.org>
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
In-Reply-To: <auGsi1N37Ptp7Kqg@wyuan.org>

On Wed, Oct 28, 2026 at 04:04:36PM +0800, Weijie Yuan wrote:
> On Wed, Oct 28, 2026 at 11:41:29AM +0800, Dongliang Mu wrote:
> > Move the GDB debugging translation into process/debugging. Update the
> > process and development tools indexes to match the current English
> > structure.
> > 
> > Synchronize the process index with upstream revision a03ef333fbd6.
> > 
> > Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> > ---
> >  .../translations/zh_CN/dev-tools/index.rst    |  37 +++---
> >  .../debugging}/gdb-kernel-debugging.rst       |  15 ++-
> >  .../zh_CN/process/debugging/index.rst         |  62 ++++++++++
> >  .../translations/zh_CN/process/index.rst      | 111 +++++++++++-------
> >  4 files changed, 160 insertions(+), 65 deletions(-)
> >  rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
> >  create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst
> 
> [...]
> 
> >  ============
> >  内核开发工具
> >  ============
> >  
> > -本文档是有关内核开发工具文档的合集。
> > -目前这些文档已经整理在一起，不需要再花费额外的精力。
> > -欢迎任何补丁。
> > +本文档收集了用于内核开发的工具文档。目前这些文档只是汇集在一起，尚未充分整理成一份连贯的指南；欢迎提交补丁！
> >  
> > -有关测试专用工具的简要概述，参见
> > -Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> > +测试工具的简要概述见 ``Documentation/dev-tools/testing-overview.rst``。
> > +
> > +调试专用工具见 ``Documentation/process/debugging/index.rst``。
> >  
> >  .. toctree::
> >     :caption: 目录
> > @@ -21,21 +19,26 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> >     testing-overview
> >     sparse
> >     kcov
> > -   kcsan
> > -   kmsan
> >     gcov
> >     kasan
> > +   kmsan
> >     ubsan
> >     kmemleak
> > -   gdb-kernel-debugging
> > +   kcsan
> >  
> >  Todolist:
> >  
> > - - checkpatch
> > - - coccinelle
> > - - kfence
> > - - kgdb
> > - - kselftest
> > - - kunit/index
> > - - ktap
> > - - checkuapi
> > +* checkpatch
> > +* clang-format
> > +* coccinelle
> > +* context-analysis
> > +* lkmm/index
> > +* kfence
> > +* kselftest
> > +* kunit/index
> > +* ktap
> > +* checkuapi
> > +* gpio-sloppy-logic-analyzer
> > +* autofdo
> > +* propeller
> > +* container
> 
> + cc Chen-Yu
> 
> My b4 review agent scanner says..
> 
> | OpenAI Codex <codex@openai.com>:
> | 
> | The move leaves Documentation/translations/zh_TW/admin-guide/README.rst
> | (line 289) pointing readers to the deleted
> | Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst.
> | Please update that reference too, either to the new zh_CN path or to the
> | existing zh_TW/process/debugging/gdb-kernel-debugging.rst translation,
> | so readers can still locate the debugging guide.
> 
> Seems to be a good finding :-)
> 
> Thanks.

Sorry, actually I did not Cc Chen-Yu.. Now done.

Sorry for the noise.
