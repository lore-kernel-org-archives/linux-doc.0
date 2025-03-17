Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB134748D
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204819; cv=none; b=hUd3OV8Mv8Jk0gr4Wpb5IEJZqAAUnknK88DJpHFOrWoX/P/cfefzAQ8QAsCw6wKFP/gqD+8xnHjK79hVKLgECNR6Hh01h0YykgGBNSnO9uWpL8UmVh7K6L9HPzX7cHUNThNl0ykKeNRTrMDgVJGRGjHqXGb1s3SdSwCTJdbi5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204819; c=relaxed/simple;
	bh=2veRFn9s6smtCQqoc4SQYbL4EFFITKrxLNOuXB9fl50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBMGHAlg6KCKn/aqRJEr+OV1KPMYtoCUAca/gqpRDScl3F5wAO5LbgZi9kaeFQJu3iyvJYjKP3UKO6OPrfTAiIsujv4SCYZ02HTlvfjVYOc0q4aM9khXvlYzXQFgPf7+vjVae+f1sswByBP6bQff5sSgw3IE+xyAGX7LkeFJruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Uy/9j7jF; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Uy/9j7jF"
Message-ID: <35073023-ef0f-4ae1-adbb-80557b1ff909@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742204815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6z6T75WahHqlf6G0BJLxKM4EYAkPMuCV3PEMCzh/2qg=;
	b=Uy/9j7jFrDKhUV+RD7ZM/gFI6HWTyScAGT+zAcAIVzaW2MWADDrL287JKGY9azIi5wD5nP
	poeMbqaXuZfgy7Gx2/Pu2C/rcNsRoT41t8S5T4vXNCEEBmcH8Lnz/eTKqJULjpUYydaP+S
	DpvjP9ZGwA0g7P4tvsnGfTzo77pP2lc=
Date: Mon, 17 Mar 2025 17:46:38 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] docs/zh_CN: Add how-to of Chinese translation
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250314102833.70037-1-siyanteng@cqsoftware.com.cn>
 <CAD-N9QVWsq3p4Axsm8V2_fQTHybU6vkZQHnWLwNo8=4BvGzpyA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAD-N9QVWsq3p4Axsm8V2_fQTHybU6vkZQHnWLwNo8=4BvGzpyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/16/25 8:59 AM, Dongliang Mu 写道:
> On Fri, Mar 14, 2025 at 6:28 PM Yanteng Si <siyanteng@cqsoftware.com.cn> wrote:
>> From: Yanteng Si <si.yanteng@linux.dev>
>>
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
>> Link: https://lore.kernel.org/r/20250227103602.321198-1-si.yanteng@linux.dev
>> Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
> As observed from my side, I think this how-to-translate manual covers
> all the things in my mind (only some comments left below).
>
> If Yanteng has other things in mind, I can help write some guidance.

I think there is still a lack of a quick guide to using

reStructuredText (RST). We should sort out the

frequently used chapters, simplify the content, and

insert them as a subsection at an appropriate position

in this article. It would be best to include many small

examples. Refer to 
<https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#quick-syntax-overview>. 


Of course, many common compilation warnings often

puzzle beginners. Perhaps a small section on these

should also be added.

>
> Dongliang Mu
>
>> ---
>>   Documentation/translations/zh_CN/how-to.rst | 445 ++++++++++++++++++++
>>   Documentation/translations/zh_CN/index.rst  |  24 +-
>>   2 files changed, 457 insertions(+), 12 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/how-to.rst
>>
>> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
>> new file mode 100644
>> index 000000000000..280fd3263237
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
>> +       git clone https://mirrors.hust.edu.cn/git/lwn.git
>              git clone https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux
>
> In order to keep this same directory, I just add a folder name.
OK!
>> +
>> +这是 linux-doc 开发树，可能会落后于 Alex 的开发树，但是不多。如果将来有较快
>> +的 mirror，请随时更改。
> We can change to :
>
> 这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果将来有较快的 mirror，可随时更改。

how about:

这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果您了解到更快的 mirror，请随时 **添加** 。

>
>> +
>> +命令执行完毕后，您会在当前目录下得到一个 linux 目录，该目录就是您之后的工作
>> +仓库，请把它放在一个稳妥的位置。
>> +
>> +安装文档构建环境
>> +----------------
>> +
>> +内核仓库里面提供了一个半自动化脚本，执行该脚本，会检测您的发行版中需要安
>> +装哪些包，请按照命令行提示进行安装，通常您只需要复制命令并执行就行。
> 包->软件包
OK!
>
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
> 建议英文两侧都添加空格，不过可以后续进行调整。我后续可以提交补丁处理。

OK.


Thanks,

Yanteng


