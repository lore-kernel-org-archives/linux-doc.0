Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F70412C7FD
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154801; cv=none; b=mzifYE+XaK7lGHg40oDgADyyWNhT10qfR86XZ5a5DmAQNTZo+Mu/3Dk7a8rEJNQ+lCqi3nYxRafNJh5hBknV07kM2rvFd/GktKWbRTdaH2E/5pRdFj44op5r5SikEsAYroVng3OCiUnAMWkKL0J8fkJOv1HqPco53UmnDFFU/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154801; c=relaxed/simple;
	bh=xfaLt1Vi3yWhpzhzi2J3k8gYHxfYA++jtfQ+v/E3CNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7fWru+qFhxHcXmsj7hfP/wl2nDnojSj2IJJupVBkTKPCAsi7GqV8BjC6k9o8gDyOKA/gEJdDQdCxzhrJgUTb+PGRA2Yq5l/DOWp90OZw88O1ynCIvqy2tA7Rqn4cDNm4Vlkop6ysjR31+CN16i+84mApiYNCf1brXrzsp7Bh+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=emkTJ73I; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="emkTJ73I"
Message-ID: <a829619f-2c3d-447c-a022-7c563dcbfc7f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743154795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FLfPIFI7CNxeyFa+KHGdBFQyM4EFKI/eJAPor5sKPR4=;
	b=emkTJ73If3PX/PaAXkhaKsbzBIrPJk8h4WSoHqAbG7bHG3BnOhq/agNPNaE6HuAOyDmhE+
	4uQAE3VNa/DrXPZnuCLt1J6fkA+hmVLgfm2DsktKE0VxhhsB4s8qAP/WuTz2dN8O4J3OVO
	YZYrPyHpneNtYvDRNb94JbwEz9wOecU=
Date: Fri, 28 Mar 2025 17:39:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add how-to of Chinese translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, corbet@lwn.net, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org
References: <cover.1742889962.git.si.yanteng@linux.dev>
 <28d37c70b09e3a3c9d004e23e2afdbdbde910999.1742889962.git.si.yanteng@linux.dev>
 <CAJy-Amnw8a+BAqWUymxs_gveUdXhaqMAkf=7xbPJXPWQo9xj1Q@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAJy-Amnw8a+BAqWUymxs_gveUdXhaqMAkf=7xbPJXPWQo9xj1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/25/25 6:04 PM, Alex Shi 写道:
> Yanteng Si <si.yanteng@linux.dev> 于2025年3月25日周二 16:19写道：
>> Many new faces keep appearing on the mailing list from time to
>> time, and there may be many potential developers who want to
>> participate in the Chinese translation but don't know how to
>> get started. As more and more documents are translated, it is
>> becoming increasingly important to improve the maintainability
>> of Chinese documents. We have a lot of conventions, but currently
>> these conventions are still being passed on orally. At the same
>> time, during the review process, especially for the first few
>> patches submitted by newbies, we have made too many repetitive
>> comments. In order to address the above issues, I have drafted
>> this guide, and there is still a lot that needs to be improved.
>>
>> Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
>> ---
>>   Documentation/translations/zh_CN/how-to.rst | 445 ++++++++++++++++++++
>>   Documentation/translations/zh_CN/index.rst  |  24 +-
>>   2 files changed, 457 insertions(+), 12 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/how-to.rst
>>
>> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
>> new file mode 100644
>> index 000000000000..08268ac273bb
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/how-to.rst
>> @@ -0,0 +1,445 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=========================
>> +Linux内核中文文档翻译规范
>> +=========================
>> +
>> +修订记录：
>> + - v1.0 2025年3月14日，司延腾参考社区的指导意见修订了部分内容。
>> +
>> +制定规范的背景
>> +==============
>> +
>> +过去几年，在广大社区爱好者的友好合作下，Linux 内核中文文档迎来了蓬勃的发
>> +展。在翻译的早期，一切都是混乱的，社区对译稿只有一个准确翻译的要求，以鼓
>> +励更多的开发者参与进来，这是从0到1的必然过程，所以早期的中文文档目录更加
>> +具有多样性，不过好在文档不多，维护上并没有过大的压力。
>> +
>> +然而，世事变幻，不觉有年，现在内核中文文档在前进的道路上越走越远，很多潜
>> +在的问题逐渐浮出水面，而且随着中文文档数量的增加，翻译更多的文档与提高中
>> +文文档可维护性之间的矛盾愈发尖锐。由于文档翻译的特殊性，很多开发者并不会
>> +一直更新文档，如果中文文档落后英文文档太多，文档更新的工作量会远大于重新
>> +翻译。而且邮件列表中陆续有新的面孔出现，他们那股热情，就像燃烧的火焰，能
>> +瞬间点燃整个空间，可是他们的补丁往往具有个性，这会给审阅带来了很大的困难，
>> +reviewer 们只能耐心地指导他们如何与社区更好地合作，但是这项工作具有重复
>> +性，长此以往，会渐渐浇灭 reviewer 审阅的热情。
>> +
>> +虽然内核文档中已经有了类似的贡献指南，但是缺乏专门针对于中文翻译的，尤其
>> +是对于新手来说，浏览大量的文档反而更加迷惑，该文档就是为了缓解这一问题而
>> +编写，目的是为提供给新手一个快速翻译指南。
>> +
>> +详细的贡献指南：Documentation/translations/zh_CN/process/index.rst。
>> +
>> +环境搭建
>> +========
>> +
>> +工欲善其事必先利其器，如果您目前对内核文档翻译满怀热情，并且会独立地安装
>> +linux 发行版和简单地使用 linux 命令行，那么可以迅速开始了。若您尚不具备该
>> +能力，很多网站上会有详细的手把手教程，最多一个上午，您应该就能掌握对应技
>> +能。您需要注意的一点是，请不要使用 root 用户进行后续步骤和文档翻译。
>> +
>> +拉取开发树
>> +----------
>> +
>> +中文文档翻译工作目前独立于 linux-doc 开发树开展，所以您需要拉取该开发树，
>> +打开终端命令行执行::
>> +
>> +       git clone git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>> +
>> +如果您遇到网络连接问题，也可以执行以下命令::
>> +
>> +       git clone https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
>> +
>> +这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果您了解到更快的 mirror，
>> +请随时 **添加** 。
>> +
>> +命令执行完毕后，您会在当前目录下得到一个 linux 目录，该目录就是您之后的工作
>> +仓库，请把它放在一个稳妥的位置。
>> +
>> +安装文档构建环境
>> +----------------
>> +
>> +内核仓库里面提供了一个半自动化脚本，执行该脚本，会检测您的发行版中需要安
>> +装哪些软件包，请按照命令行提示进行安装，通常您只需要复制命令并执行就行。
>> +::
>> +
>> +       cd linux
>> +       ./scripts/sphinx-pre-install
>> +
>> +以Fedora为例，它的输出是这样的::
>> +
>> +       You should run:
>> +
>> +               sudo dnf install -y dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts google-noto-sans-cjk-fonts graphviz-gd latexmk librsvg2-tools texlive-anyfontsize texlive-capt-of texlive-collection-fontsrecommended texlive-ctex texlive-eqparbox texlive-fncychap texlive-framed texlive-luatex85 texlive-multirow texlive-needspace texlive-tabulary texlive-threeparttable texlive-upquote texlive-wrapfig texlive-xecjk
>> +
>> +       Sphinx needs to be installed either:
>> +       1) via pip/pypi with:
>> +
>> +               /usr/bin/python3 -m venv sphinx_latest
>> +               . sphinx_latest/bin/activate
>> +               pip install -r ./Documentation/sphinx/requirements.txt
>> +
>> +           If you want to exit the virtualenv, you can use:
>> +               deactivate
>> +
>> +       2) As a package with:
>> +
>> +               sudo dnf install -y python3-sphinx
>> +
>> +           Please note that Sphinx >= 3.0 will currently produce false-positive
>> +          warning when the same name is used for more than one type (functions,
>> +          structs, enums,...). This is known Sphinx bug. For more details, see:
>> +               https://github.com/sphinx-doc/sphinx/pull/8313
>> +
>> +请您按照提示复制打印的命令到命令行执行，您必须具备 root 权限才能执行 sudo
>> +开头的命令。
>> +
>> +如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
>> +sphinx 虚拟环境，即只需要执行::
>> +
>> +       /usr/bin/python3 -m venv sphinx_latest
>> +       . sphinx_latest/bin/activate
>> +       pip install -r ./Documentation/sphinx/requirements.txt
>> +
>> +最后执行以下命令退出虚拟环境::
>> +
>> +       deactivate
>> +
>> +您可以在任何需要的时候再次执行以下命令进入虚拟环境::
>> +
>> +       . sphinx_latest/bin/activate
>> +
>> +进行第一次文档编译
>> +------------------
>> +
>> +进入开发树目录::
>> +
>> +       cd linux
>> +
>> +这是一个标准的编译和调试流程，请每次构建时都严格执行::
>> +
>> +       . sphinx_latest/bin/activate
>> +       make cleandocs
>> +       make htmldocs
>> +       deactivate
>> +
>> +检查编译结果
>> +------------
>> +
>> +编译输出在Documentation/output/目录下，请用浏览器打开该目录下对应
>> +的文件进行检查。
>> +
>> +git和邮箱配置
>> +-------------
>> +
>> +打开命令行执行::
>> +
>> +       sudo dnf install git-email
>> +       vim ~/.gitconfig
>> +
>> +这里是我的一个配置文件示范，请根据您的邮箱域名服务商提供的手册替换到对
>> +应的字段。
>> +::
>> +
>> +       [user]
>> +              name = Yanteng Si                # 这会出现在您的补丁头部签名栏
>> +              email = si.yanteng@linux.dev     # 这会出现在您的补丁头部签名栏
>> +
>> +       [sendemail]
>> +              from = Yanteng Si <si.yanteng@linux.dev> # 这会出现在您的补丁头部
>> +              smtpencryption = ssl
>> +              smtpserver = smtp.migadu.com
>> +              smtpuser = si.yanteng@linux.dev
>> +              smtppass = <passwd>      # 建议使用第三方客户端专用密码
>> +              chainreplyto = false
>> +              smtpserverport = 465
>> +
>> +关于邮件客户端的配置，请查阅Documentation/translations/zh_CN/process/email-clients.rst。
>> +
>> +开始翻译文档
>> +============
>> +
>> +文档索引结构
>> +------------
>> +
>> +目前中文文档是在Documentation/translations/zh_CN/目录下进行，该
>> +目录结构最终会与Documentation/结构一致，所以您只需要将您感兴趣的英文
>> +文档文件和对应的 index.rst 复制到 zh_CN 目录下对应的位置，然后修改更
>> +上一级的 index 即可开始您的翻译。
>> +
>> +为了保证翻译的文档补丁被顺利合并，不建议多人同时翻译一个目录，因为这会
>> +造成补丁之间互相依赖，往往会导致一部分补丁被合并，另一部分产生冲突。
>> +
>> +如果实在无法避免两个人同时对一个目录进行翻译的情况，请将补丁制作进一个补
>> +丁集。但是不推荐刚开始就这么做，因为经过实践，在没有指导的情况下，新手很
>> +难一次处理好这个补丁集。
>> +
>> +请执行以下命令，新建开发分支::
>> +
>> +       git checkout docs-next
>> +       git branch my-trans
>> +       git checkout my-trans
>> +
>> +译文格式要求
>> +------------
>> +
>> +       - 每行长度最多不超过40个字符
>> +       - 每行长度请保持一致
>> +       - 标题的下划线长度请按照一个英文一个字符、一个中文两个字符与标题对齐
>> +       - 其它的修饰符请与英文文档保持一致
>> +
>> +此外在译文的头部，您需要插入以下内容::
>> +
>> +       .. SPDX-License-Identifier: GPL-2.0
>> +       .. include:: ../disclaimer-zh_CN.rst  #您需要了解该文件的路径，根
>> +                                               据您实际翻译的文档灵活调整
>> +
>> +       :Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
>> +
>> +       :翻译:
>> +
>> +        司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
>> +
>> +翻译技巧
>> +--------
>> +
>> +中文文档有每行40字符限制，因为一个中文字符等于2个英文字符。但是社区并没有
>> +那么严格，一个诀窍是将您的翻译的内容与英文原文的每行长度对齐即可，这样，
>> +您也不必总是检查有没有超限。
>> +
>> +如果您的英文阅读能力有限，可以考虑使用辅助翻译工具，例如 deepseek 。但是您
>> +必须仔细地打磨，使译文达到“信达雅”的标准。
>> +
>> +**请注意** 社区不接受纯机器翻译的文档，社区工作建立在信任的基础上，请认真对待。
>> +
>> +编译和检查
>> +----------
>> +
>> +请执行::
>> +
>> +       . sphinx_latest/bin/activate
>> +       make cleandocs
>> +       make htmldocs
>> +
>> +解决与您翻译的文档相关的 warning 和 error，然后执行::
>> +
>> +       make cleandocs  #该步骤不能省略，否则可能不会再次输出真实存在的警告
>> +       make htmldocs
>> +       deactivate
>> +
>> +进入 output 目录用浏览器打开您翻译的文档，检查渲染的页面是否正常，如果正常，
>> +继续进行后续步骤，否则请尝试解决。
>> +
>> +制作补丁
>> +========
>> +
>> +提交改动
>> +--------
>> +
>> +执行以下命令，在弹出的交互式页面中填写必要的信息。
>> +::
>> +
>> +       git add .
>> +       git commit -s -v
>> +
>> +请参考以下信息进行输入::
>> +
>> +       docs/zh_CN: Add self-protection index Chinese translation
>> +
>> +       Translate .../security/self-protection.rst into Chinese.
>> +
>> +       Update the translation through commit b080e52110ea      #请执行git log <您翻译的英文文档路径> 复制最顶部第一个补丁的sha值的前12位，替换掉12位sha值。
>> +       ("docs: update self-protection __ro_after_init status")
>> +
>> +       Signed-off-by: Yanteng Si <si.yanteng@linux.dev>        #如果您前面的步骤正确执行，该行会自动显示，否则请检查gitconfig文件。
>> +
>> +保存并退出。
>> +
>> +**请注意** 以上四行，缺少任何一行，您都将会在第一轮审阅后返工，如果您需要一个更加明确的示例，请对 zh_CN 目录执行 git log。
>> +
>> +导出补丁和制作封面
>> +------------------
>> +
>> +这个时候，可以导出补丁，做发送邮件列表最后的准备了。命令行执行::
>> +
>> +       git format-patch -N
>> +
>> +然后命令行会输出类似下面的内容::
>> +
>> +       0001-docs-zh_CN-add-xxxxxxxx.patch
>> +       0002-docs-zh_CN-add-xxxxxxxx.patch
>> +       ……
>> +
>> +测试补丁
>> +--------
>> +
>> +内核提供了一个补丁检测脚本，请执行::
>> +
>> +       ./scripts/checkpatch.pl *.patch
>> +
>> +参考脚本输出，解决掉所有的 error 和 warning，通常情况下，只有下面这个
>> +warning 不需要解决::
>> +
>> +       WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> +
>> +一个简单的解决方法是一次只检查一个补丁，然后打上该补丁，直接对译文进行修改，
>> +然后执行以下命令为补丁追加更改::
>> +
>> +       git checkout docs-next
>> +       git branch test-trans
>> +       git am 0001-xxxxx.patch
>> +       ./scripts/checkpatch.pl 0001-xxxxx.patch
>> +       直接修改您的翻译
>> +       git add .
>> +       git am --amend
>> +       保存退出
>> +       git am 0002-xxxxx.patch
>> +       ……
>> +
>> +重新导出再次检测，重复这个过程，直到处理完所有的补丁。
>> +
>> +最后，如果检测时没有 warning 和 error 需要被处理或者您只有一个补丁，请跳
>> +过下面这个步骤，否则请重新导出补丁制作封面::
>> +
>> +       git format-patch -N --cover-letter --thread=shallow  #N为您的补丁数量,N一般要大于1。
>> +
>> +然后命令行会输出类似下面的内容::
>> +
>> +       0000-cover-letter.patch
>> +       0001-docs-zh_CN-add-xxxxxxxx.patch
>> +       0002-docs-zh_CN-add-xxxxxxxx.patch
>> +
>> +您需要用编辑器打开0号补丁，修改两处内容::
>> +
>> +       vim 0000-cover-letter.patch
>> +
>> +       ...
>> +       Subject: [PATCH 0/1] *** SUBJECT HERE ***       #修改该字段，概括您的补丁集都做了哪些事情
>> +
>> +       *** BLURB HERE ***                              #修改该字段，详细描述您的补丁集做了哪些事情
>> +
>> +       Yanteng Si (1):
>> +         docs/zh_CN: add xxxxx
>> +       ...
>> +
>> +如果您只有一个补丁，则可以不制作封面，即0号补丁，只需要执行::
>> +
>> +       git format-patch -1
>> +
>> +把补丁提交到邮件列表
>> +====================
>> +
>> +恭喜您，您的文档翻译现在可以提交到邮件列表了。
>> +
>> +获取维护者和审阅者邮箱以及邮件列表地址
>> +--------------------------------------
>> +
>> +内核提供了一个自动化脚本工具，请执行::
>> +
>> +       ./scripts/get_maintainer.pl *.patch
>> +
>> +将输出的邮箱地址保存下来。
>> +
>> +将补丁提交到邮件列表
>> +--------------------
>> +
>> +打开上面您保存的邮件地址，执行::
>> +
>> +       git send-email *.patch --to <maintainer email addr> --cc <others addr>  #一个to对应一个地址，一个cc对应一个地址，有几个就写几个。
>> +
>> +执行该命令时，请确保网络通常，邮件发送成功一般会返回250。
> add a self apply reminder here, like:
> 您可以先发送给自己，尝试发出的 patch 是否可以用 'git am' 工具正常打上。
> 如果检查正常， 您就可以放心的发送到社区评审了。
>
> Others looks good to me.

OK, Thanks.


Thanks,

Yanteng


