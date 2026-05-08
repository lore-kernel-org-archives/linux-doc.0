Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B931AF07
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 03:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778211914; cv=none; b=JhtW53p1OCElSdw01WqrnbbfHQ5Y6fQJZpVZQgKZBVjV6LvJybbG2hQ9QGBO5kmibNZwI+atIy+dBvWW+0SX8pABNR7Fm97AXOUfQ+O0O7T5K4RC+CGDDi7iSsjCDWq1GqR48Knppjb4Tf3T3nt9dKFpwD0Fa8Sy8j6AoHxgHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778211914; c=relaxed/simple;
	bh=ya6iLGedV+I+zfYiQraTlSVMxPXvTJ72s1JPVCaELOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFgx3HGRb2ylqfhN+zYiudB0Iaz/gIBHzCEC6T7WM9aI+8no5u5A+lpaolDpQYu4KNQuDKC2WctQtYbDipQuECChW/EWhy39+d/j90LPh34rM1sZw6wvTz34k11JeR0d2U/KxbZ5/lcjV30CUpG9/KpU1Oavq+fU4kJ2OSYJYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiyfcaBt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiyfcaBt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bab82d75fdso8756365ad.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 20:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778211913; x=1778816713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2MNJQuQHonviJsfFL3RyMEMpwd00YH8TtewXiLyW0U=;
        b=EiyfcaBtVzCELvrYali5GZf580q3DOcwu7mOumc2VFTUuX5VIHa7DDwZ2CYeOBd2kt
         6L2NthcOFY9sDAf0wWtFA/CDDUvMrZ/K8NSVjazoAbjAkZqTdxo0u/9Et/KN2YiiWjz5
         WfRY60TtI6XS0sM/4Nd2YVuFubm6u9jKUrlRSdSssJR8muFD9L/lql/I347r5A3r2dlY
         AMzCKj8njV5uInlnCvU1LEEMB6CanxNpimVzYt/MoOakRlGRKViMtu5LmozjWBQC1dd5
         6Mbam/g576pTVFUwSHoBbhC6iF6E9fetlMoAcO+jCyYuGoYb2gadfJentYDn4mxzNSj2
         rpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778211913; x=1778816713;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2MNJQuQHonviJsfFL3RyMEMpwd00YH8TtewXiLyW0U=;
        b=bcUOJ94CRgmK1fS9ietfCQUpmvJOeJrwSyd9Hy9R06l0ibINXqtT3QG8HhSHmsiF/c
         DHybnYy6k22VE5e3m01lt7MGa3MFyPhdv2KFhv2x1HCjeOP1UYPkN43VcOZyl9aZmZdh
         SUZES9VUUIVYFGBBfs3BWz2lqGHXfuSW/tNj+UCzjXliCVFFtmB2waDCeyFBhh8OR0I9
         6PMoTzb7pbfmd7qMOv3tfsYFePPNgR363H+2huCRynHDmjjLxN5wEUo3z1pnb0emtP7M
         Dmk9D5mvglvwwG50xyPcFyG8r/21u917sa4JmzwireAKMmM05dlOiZxhn+9oi3HBkniz
         RyNA==
X-Gm-Message-State: AOJu0YwcuGIcOE0U/8O6LYe4jHZ1pGmYvviZ3/mDuq9//7l6hn2QP9xU
	xQHKAj3ddgGCFXlf+CuvwWqCBecr8qUOa9BxvL5JpzVgAuqav6Ppotm2jviEIVowAsY=
X-Gm-Gg: Acq92OFdFvtvzlHm9KTNKqpB3KZPuylBj7fG+DpG/7OgcbuKkV0fOFifr5VZSW6nv6u
	3kN55fZGk2ffaUxjaxXP/mBkn/HYSFO3IiopBLvS2CaSvDy30kft0EuORTbrBN7oqwBKxOhwfKR
	heBfwbm30h+Ct4q4kxhwrTApWB5vogq8AkDu7+qljNLWL1m8gmgSNhi0CPq/88F9nHYMY0ObKpQ
	/f08hkuTt6TJLQmhcClAuPzwOzMEQujoOBgBV4jnj+MVpfPg9zEJooLO6pIGfd250EU4KOWO0ba
	LHcQat+RVtJJALFhipqlMvU4EPxqyiAtxQ0Phua+uK60vQX5ETFqzfSo4+cgWTWjPh9WbTsSCM4
	K36XeMX8tpuCWRaUKAXPBeZU6Yd1jvke50ZDrWX2CBse1npoMxZ3yf62/O3+pbKxfG+ldZ4yLep
	/e6w5UxGsqOtBejWwBjjoOTvLNv3g3Uysb8yjDHcfUU0tcZ9galNXtyEyZftJypXxG
X-Received: by 2002:a17:903:37cf:b0:2ae:ac0c:5a2a with SMTP id d9443c01a7336-2ba78b43a35mr105608925ad.6.1778211912570;
        Thu, 07 May 2026 20:45:12 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f01:74be:4642:bc51:1d4d? ([240e:38b:e68:2f01:74be:4642:bc51:1d4d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d404f5sm4219875ad.30.2026.05.07.20.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 20:45:12 -0700 (PDT)
Message-ID: <4d2df7e4-63f5-41a1-af30-e630a6bb3dc3@gmail.com>
Date: Fri, 8 May 2026 11:45:05 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: restructure how-to.rst patch submission
 workflow
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420115647.2718959-1-dzm91@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260420115647.2718959-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, Thanks!

On 2026/4/20 19:56, Dongliang Mu wrote:
> Split "导出补丁和制作封面" into separate "导出补丁" and
> "为补丁集制作封面" sections, and document the single-patch
> (git format-patch -1) and multi-patch (-N) flows side by side
> so new contributors do not have to infer one from the other.
> 
> Replace the invalid "git am --amend" invocations with "git commit
> --amend" in both the checkpatch fix-up and the iteration sections.
> 
> Expand the iteration section with a worked v2 example showing where the
> changelog goes relative to the --- separator, and describe how v3/v4
> changelogs stack newest-on-top.
> 
> Finally, add a note reminding submitters to carry Reviewed-by tags from
> reviewers into the next revision, placed below Signed-off-by.
> 
> Assisted-by:Claude:claude-opus-4-7
> Signed-off-by: Dongliang Mu<dzm91@hust.edu.cn>
> ---
>   Documentation/translations/zh_CN/how-to.rst | 105 ++++++++++++++------
>   1 file changed, 77 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 3dcf6754d1df..9ec2384e1e76 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -269,13 +269,22 @@ Git 和邮箱配置
>   **请注意** 以上四行，缺少任何一行，您都将会在第一轮审阅后返工，如果您需要一个
>   更加明确的示例，请对 zh_CN 目录执行 git log。
>   
> -导出补丁和制作封面
> -------------------
> +导出补丁
> +--------
> +
> +这个时候，可以导出补丁，做发送邮件列表最后的准备了。对于单个补丁，
> +命令行执行::
> +
> +	git format-patch -1
> +
> +然后命令行会输出类似下面的内容::
> +
> +	0001-docs-zh_CN-add-xxxxxxxx.patch
>   
> -这个时候，可以导出补丁，做发送邮件列表最后的准备了。命令行执行::
> +如果您有多个补丁，命令行执行::
>   
>   	git format-patch -N
> -	# N 要替换为补丁数量，一般 N 大于等于 1
> +	# N 要替换为补丁数量，一般 N 大于 1
>   
>   然后命令行会输出类似下面的内容::
>   
> @@ -290,13 +299,12 @@ Git 和邮箱配置
>   
>   	./scripts/checkpatch.pl *.patch
>   
> -参考脚本输出，解决掉所有的 error 和 warning，通常情况下，只有下面这个
> +参考脚本输出，解决掉所有的 error 和 warning。通常情况下，只有下面这个
>   warning 不需要解决::
>   
>   	WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>   
> -一个简单的解决方法是一次只检查一个补丁，然后打上该补丁，直接对译文进行修改，
> -然后执行以下命令为补丁追加更改::
> +对于单个补丁，解决方案很简单，只需要打上该补丁，直接对译文进行修改，为补丁追加后续更改::
>   
>   	git checkout docs-next
>   	git checkout -b test-trans-new
> @@ -304,15 +312,21 @@ warning 不需要解决::
>   	./scripts/checkpatch.pl 0001-xxxxx.patch
>   	# 直接修改您的翻译
>   	git add .
> -	git am --amend
> +	git commit --amend
>   	# 保存退出
> -	git am 0002-xxxxx.patch
> -	……
>   
> -重新导出再次检测，重复这个过程，直到处理完所有的补丁。
> +随后，重新导出补丁再次检测，重复这个过程，直到处理完所有 warning 和
> +error。
> +
> +如果您有多个补丁，请按补丁集中补丁顺序对每个补丁重复上述流程，一次只处理
> +一个，不要一次 git am 多个补丁。全部处理完毕后再重新导出并再次测试。
>   
> -最后，如果检测时没有需要处理的 warning 和 error，或者您只有一个补丁，请
> -跳过下面这个步骤，否则请重新导出补丁制作封面::
> +为补丁集制作封面
> +----------------
> +
> +对于单个补丁，请跳过本节。
> +
> +如果您有多个补丁，则需要为补丁集制作一份封面，即 0 号补丁::
>   
>   	git format-patch -N --cover-letter --thread=shallow
>   	# N 要替换为补丁数量，一般 N 大于 1
> @@ -329,18 +343,14 @@ warning 不需要解决::
>   	vim 0000-cover-letter.patch
>   
>   	...
> -	Subject: [PATCH 0/N] *** SUBJECT HERE *** #修改该字段，概括您的补丁集都做了哪些事情
> +	Subject: [PATCH 0/N] *** SUBJECT HERE *** # 修改该字段，概括您的补丁集都做了哪些事情
>   
> -	*** BLURB HERE ***			  #修改该字段，详细描述您的补丁集做了哪些事情
> +	*** BLURB HERE ***			  # 修改该字段，详细描述您的补丁集做了哪些事情
>   
>   	Yanteng Si (1):
>   	  docs/zh_CN: add xxxxx
>   	...
>   
> -如果您只有一个补丁，则无需制作封面（即 0 号补丁），只需执行::
> -
> -	git format-patch -1
> -
>   把补丁提交到邮件列表
>   ====================
>   
> @@ -392,28 +402,67 @@ reviewer 的评论，做到每条都有回复，每个回复都落实到位。
>   迭代补丁
>   --------
>   
> -建议您每回复一条评论，就修改一处翻译。然后重新生成补丁，相信您现在已经具
> -备了灵活使用 git am --amend 的能力。
> +建议您每回复一条评论，就修改一处翻译，然后重新生成补丁，相信您现在
> +已经具备了灵活使用 git am 与 git commit --amend 的能力。
>   
> -每次迭代一个补丁，不要一次多个::
> +对于单个补丁，每回复完评论后修改、追加::
>   
> -	git am <您要修改的补丁>
> +	git am 0001-xxxxx.patch
>   	# 直接对文件进行您的修改
>   	git add .
>   	git commit --amend
>   
> -当您将所有的评论落实到位后，导出第二版补丁，并修改封面::
> +当您将所有的评论落实到位后，导出第二版补丁::
>   
> -	git format-patch -N -v 2 --cover-letter --thread=shallow
> +	git format-patch -1 -v 2
> +
> +命令行会输出 v2-0001-xxxxx.patch。打开该文件，在 --- 分割线下方追加
> +changelog。注意，分割线以下的内容不会进入 git 提交历史，仅作为邮件中的
> +说明供 reviewer 检查::
> +
> +	Subject: [PATCH v2] docs/zh_CN: add xxxxxx translation
> +
> +	Translate .../xxx.rst into Chinese.
> +
> +	Signed-off-by: Yanteng Si<si.yanteng@linux.dev>
> +	---
> +	v1->v2:
> +	  - 修正第二节的错别字，Reviewer-A 提出的意见
> +	  - 根据 Reviewer-B 的建议调整段落顺序
>   
> -打开 0 号补丁，在 BLURB HERE 处编写相较于上个版本，您做了哪些改动。
> +	 Documentation/translations/zh_CN/xxx.rst | 100 ++++++
> +	 1 file changed, 100 insertions(+)
>   
> -然后执行::
> +后续迭代 v3、v4 …… 时，新的 changelog 放在最上面，旧的保留在下方，按
> +从新到旧的顺序叠加。例如 v3 补丁的 --- 下方::
>   
> -	git send-email v2* --to <maintainer email addr> --cc <others addr>
> +	---
> +	v2->v3:
> +	  - ...本次相较 v2 的改动...
> +	v1->v2:
> +	  - ...上一次相较 v1 的改动...
> +
> +然后发送::
> +
> +	git send-email v2-0001-*.patch --to <maintainer email addr> --cc <others addr>
> +
> +如果您有多个补丁，迭代时请按以下原则：每次只迭代一个补丁，不要一次多个，
> +每个补丁独立重复上述流程。所有评论落实到位后，导出 v2 时附带封面::
> +
> +	git format-patch -N -v 2 --cover-letter --thread=shallow
> +
> +打开 0 号补丁，在 BLURB HERE 处写明整组补丁相较 v1 的总体改动，格式
> +同上面的单个补丁 changelog 示例。如果某个补丁需要单独说明，可在该
> +补丁文件的 --- 分割线下方追加单个补丁的 changelog。最后执行::
> +
> +	git send-email v2-*.patch --to <maintainer email addr> --cc <others addr>
>   
>   这样，新的一版补丁就又发送到邮件列表等待审阅，之后就是重复这个过程。
>   
> +此外，如果审阅者或维护者在邮件回复中给出了 Reviewed-by tag，请在下
> +一版补丁的 commit 信息中加入该 tag，放在 Signed-off-by 行的下方，以
> +便维护者合入时保留您的审阅记录。
> +
>   审阅周期
>   --------
>   
> -- 2.43.0
> 

