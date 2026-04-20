Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34E371067
	for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694202; cv=none; b=LRHbZ47AvtAW9bxtCMDCFwxrb+oJAcWERavQJe2quFjuvSjvajKo7XzFlHBd9sv5OdxJeQ4td+ZPnQUO+k187STdC1Dqi6TM+VUm15HvW0wCFQgj/YDpKdOd8+tkU42srjYFBYEJv1l0Opj6FiZoicCInmHmOnQNRI91rFWbUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694202; c=relaxed/simple;
	bh=BBIKMd5iw+aIz11O3AP3rt+gVJo6JNG9sHhrEkW9QoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2YjwszET9hktFy8R9dbStUlyqfX0b442vTAD08r1QFH+wyHJ951NFyTCG2BhDRzqgco7mHC/JqHm/S1ERVAA4y8tEyr4W56HO40zY+KDjOJ1rAZiU9kn5k7SuaQDfTYmhe63AagPwgcmSWhRTtdwepCc/eQwXczHPzAcO8e6ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T26lyO28; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T26lyO28"
Message-ID: <bec8b0d3-f38b-4463-81b0-0cc194f0496f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776694198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZTru17/NOwzoOpIsp8ujaW6GqL2KTwRU4WJEHKdwsg=;
	b=T26lyO28yl/TUnxv0fdnCEpQJPuFjXGJ3IQSUHUvLNVoDy/rOZqqDgUdGvh988gseWgAb8
	KeUclSk6j+hbUeR1tGZmVKKHrkWyEaxqScZrJibnZIl+6FudA7SkBv6BXm2J4ud7Xc0mo+
	hvNJy1ZxYISA9dWaJxs6HmVIAIveyvU=
Date: Mon, 20 Apr 2026 22:09:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: restructure how-to.rst patch submission
 workflow
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420115647.2718959-1-dzm91@hust.edu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20260420115647.2718959-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/4/20 19:56, Dongliang Mu 写道:
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
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks

Yanteng

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
> +	Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
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
