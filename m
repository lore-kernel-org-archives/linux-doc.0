Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6FAD24
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073447; cv=none; b=Tp/5HXEezLasKmV86CMYXw30xpsI3bjDG0n+LoIrkiOxUEryLqd0IE2nz5GTzw/JeqfO2NhAFtYLbCVGW4TNJS3CEyWKSm8zxfQYHYi3wxuoAWodp/mBW7UvUo70ICzkCS7sF9WJIG9k0hnXzXkw4GOTTwrZYS0dIGYfYPtPCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073447; c=relaxed/simple;
	bh=CFUKUDLG+HhpqhLnv3d7EKIWed0/kXDuGCo0tAWF2+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbJ5Ps3oE28sGakZi1eiXhF8aOD17CAZKTZE+bKj4ZuZqYejoGkWXaDPIjjWBaqDcFr4qC/0IdkinKZi0H30qnCSTdtw2mflOIS0pR08IIpjRTEXLiWEOioYW0BDoYF9qAlpjNfrSCXB+yeF7Przuhf02pIAQDw/eQwpF3ERo7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qUlW5UKy; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qUlW5UKy"
Message-ID: <4193bc21-2f9e-43da-be71-b70e1eabb074@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741073440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRzQx4/jrEdAKYR5lJgJy6OUxBPQ14F3reTA1CU2fp0=;
	b=qUlW5UKyvY6jH+YRo5uwKXejRj4dTQNzUy8lqA/PxYj/fPRhRk6dXdxEFGrnqaeYRQJW8+
	iFWJ7makogElx7EoCDg7w6cwD97RdTjYGS6VA5zq6a7JUI0Todq9N8Ra1bDXOHknwYTyK0
	Jow3+KqyiW6ZjBrQxtaR4SrZ50kf/7E=
Date: Tue, 4 Mar 2025 15:30:18 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] docs/zh_CN: Add how-to of Chinese translation
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250227103602.321198-1-si.yanteng@linux.dev>
 <CAD-N9QXc+g9nQAmeeed=B0teuAJ_DoNggUyh_HM+dxwLtp1VfQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAD-N9QXc+g9nQAmeeed=B0teuAJ_DoNggUyh_HM+dxwLtp1VfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/27/25 8:51 PM, Dongliang Mu 写道:
> On Thu, Feb 27, 2025 at 6:36 PM Yanteng Si <si.yanteng@linux.dev> wrote:
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
>>   Documentation/translations/zh_CN/how-to.rst | 443 ++++++++++++++++++++
>>   Documentation/translations/zh_CN/index.rst  |  24 +-
>>   2 files changed, 455 insertions(+), 12 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/how-to.rst
>>
>> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
>> new file mode 100644
>> index 000000000000..cf66c25e6ab0
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/how-to.rst
>> @@ -0,0 +1,443 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=========================
>> +Linux内核中文文档翻译规范
>> +=========================
>> +
>> +修订记录：
>> + - v0.1 2024年12月11日，司延腾总结了过去几年的审阅和翻译经验，编写了一份初稿。
>> + - v0.2 2025年 2月14日，司延腾总结了该文档的实践经验，修改了制作补丁集合的部分章节。
>> + - v0.3 2025年 2月27日，司延腾调整了文档格式，提交RFC到linux-doc邮件列表收集修订意见。
>> +
>> +制定规范的背景
>> +==============
>> +
>> +过去几年，在广大社区爱好者的友好合作下，Linux内核中文文档迎来了蓬勃的发
>> +展。在翻译的早期，一切都是混乱的，社区对译稿只有一个准确翻译的要求，以鼓
>> +励更多的开发者参与进来，这是从0到1的必然过程，所以早期的中文文档目录更加
>> +具有多样性，不过好在文档不多，维护上并没有过大的压力。
>> +
>> +然而，世事变幻，不觉有年，现在内核中文文档在前进的道路上越走越远，很多潜
>> +在的问题逐渐浮出水面，而且随着中文文档数量的增加，翻译更多的文档与提高中
>> +文文档可维护性之间的矛盾愈发尖锐。由于文档翻译的特殊性，很多开发者并不会
>> +一直更新文档，如果中文文档落后英文文档太多，文档更新的工作量会远大于重新
>> +翻译。而且邮件列表中陆续有新的面孔出现，他们那股热情,就像燃烧的火焰,能瞬
> replace ',' with '，'
OK.
>
>> +间点燃整个空间，可是他们的补丁往往具有个性，这会给审阅带来了很大的困难，
>> +reviewer们只能耐心地指导他们如何与社区更好的合作，但是这项工作具有重复
> 的 -> 地
OK.
>
>> +性，长此以往，会渐渐浇灭reviewer审阅的热情。
>> +
>> +虽然内核文档中已经有了类似的贡献指南，但是缺乏专门针对于中文翻译的，尤其
>> +是对于新手来说，浏览大量的文档反而更加迷惑，该文档就是为了缓解这一问题而
>> +编写，目的是为提供给新手一个快速翻译指南。
>> +
>> +环境搭建
>> +========
>> +
>> +工欲善其事必先利其器，如果您目前对内核文档翻译满怀热情，并且会独立地安装
>> +linux发行版和简单地使用linux命令行，那么可以迅速开始了。若您尚不具备该
>> +能力，很多网站上会有详细的手把手教程，最多一个上午，您应该就能掌握对应技
>> +能。您需要注意的一点是，请不要使用root用户进行后续步骤和文档翻译。
>> +
>> +拉取开发树
>> +----------
>> +
>> +中文文档翻译工作在linux-doc开发树下开展，所以您需要拉取linux-doc树，
>> +打开终端命令行执行::
>> +
>> +       git clone git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
> If I understand correctly, linux-doc refers to
> git://git.lwn.net/linux.git, right?

yeah, how about

中文文档翻译工作目前独立于linux-doc开发树开展，所以您需要拉取该开发树，
打开终端命令行执行::

        git clone 
git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git


agree?


>
>> +
>> +如果您遇到网络连接问题，也可以执行以下命令::
>> +
>> +       git clone https://mirrors.hust.edu.cn/git/lwn.git
>> +
>> +这是liux-doc开发树，可能会落后于alex的开发树，但是不多。如果将来有较快
> liux -> linux
OK.
>
>> +的mirror，请随时更改。
> lwn.git just mirrors from git://git.lwn.net/linux.git, other than
> git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git.
>
> We could create another mirror for
> git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git.
Nice!
>
>> +
>> +命令执行完毕后，您会在当前目录下得到一个linux的目录，该目录就是您之后的
> How about 得到一个linux目录?
OK.
>
>> +工作仓库，请把它放在一个稳妥的位置。
>> +
>> +安装文档构建环境
>> +----------------
>> +
>> +内核仓库里面提供了一个半自动化脚本，执行该脚本，会检测您的发行版中需要安
>> +装哪些包，请按照命令行提示进行安装，通常您只需要复制命令并执行就行。
>> +::
>> +
>> +       cd linux
>> +       ./scripts/sphinx-pre-install
>> +
>> +在我的发行版中，它的输出是这样的::
> Mention your distribution in the text?
No, I don't think I can guide everyone to use the same distribution as 
mine. :)
>
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
>> +请您按照提示复制打印的命令到命令行执行，您必须具备root权限才能执行sudo
>> +开头的命令。
>> +
>> +如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
>> +sphinx虚拟环境，即只需要执行::
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
> Shall we mention `-j N` to speed up the compilation?
It seems that multi-threaded compilation is used by default.
>
>> +------------
>> +
>> +编译输出在Documentation/output/ 目录下，请用浏览器打开该目录下对应
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
>> +开始翻译文档
>> +============
>> +
>> +文档索引结构
>> +------------
>> +
>> +目前中文文档是在Documentation/translations/zh_CN/目录下进行，该
>> +目录结构最终会与Documentation/结构一致，所以您只需要将您感兴趣的英文
>> +文档文件和对应的index.rst复制到zh_CN目录下对应的位置，然后修改更上一
>> +级的index即可开始您的翻译。
>> +
>> +为了保证翻译风格，一个目录由一位开发者翻译，这不是一条规定，而是一个默契。
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
> alexs/linux.git does not have the branch docs-next.
>
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
>> +如果您的英文阅读能力有限，可以考虑使用辅助翻译工具，例如deepseek。但是您
>> +必须仔细地打磨，使译文达到“信达雅”的标准。
>> +
>> +**note** 社区不接受纯机器翻译的文档，社区工作建立在信任的基础上，请认真对待。
> note -> 请注意
OK.
>
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
>> +解决与您翻译的文档相关的warning和error，然后执行::
>> +
>> +       make cleandocs  #该步骤不能省略，否则可能不会再次输出真实存在的警告
>> +       make htmldocs
>> +       deactivate
>> +
>> +进入output目录用浏览器打开您翻译的文档，检查渲染的页面是否正常，如果正常，继
>> +续进行后续步骤，否则请尝试解决。
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
>> +       docs/zh_CN: Add xxxx index Chinese translation          # xxxx为您翻译的英文文档名称，去除.rst
>> +
>> +       Translate .../AAAA/xxxx.rst into Chinese.               #请用实际路径替换掉相应字段。该部分内容您可自由创作，只要描述清楚您做了什么。
>> +
>> +       Update the translation through commit 12位sha值           #请执行git log <您翻译的英文文档路径> 复制最顶部第一个补丁的sha值的前12位，替换掉12位sha值。
>> +
>> +       Signed-off-by: Yanteng Si <si.yanteng@linux.dev>        #如果您前面的步骤正确执行，该行会自动显示，否则请检查gitconfig文件。
>> +
>> +保存并退出。
>> +
>> +**note** 以上四行，缺少任何一行，您都将会在第一轮审阅后返工，如果您需要一个更加明确的示例，请对zh_CN目录执行git log。
> note -> 请注意
OK.
>
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
>> +参考脚本输出，解决掉所有的error和warning，通常情况下，只有下面这个warning
>> +不需要解决::
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
>> +最后，如果检测时没有warning和error需要被处理或者您只有一个补丁，请跳过下
>> +面这个步骤，否则请重新导出补丁制作封面::
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
>> +
>> +如果该步骤被中断，您可以检查一下，继续用上条命令发送失败的补丁，一定不要再
>> +次发送已经发送成功的补丁。
>> +
>> +积极参与审阅过程并迭代补丁
>> +==========================
>> +
>> +补丁提交到邮件列表并不代表万事大吉，您还需要积极回复maintainer和reviewer
>> +的评论，做到每条都有回复，每个回复都落实到位。
>> +
>> +如何回复评论
>> +------------
>> +
>> + - 请先将您的邮箱客户端信件回复修改为 **纯文本** 格式，并去除所有签名，尤其是
>> +   企业邮箱。
>> + - 然后点击回复按钮，并将要回复的邮件带入，
>> + - 在第一条评论行尾换行，输入您的回复
>> + - 在第二条评论行尾换行，输入您的回复
>> + - 直到处理完最后一条评论，换行空两行输入问候语和署名
>> +
>> +注意，信件回复请尽量使用英文。
>> +
>> +迭代补丁
>> +--------
>> +
>> +建议您每回复一条评论，就修改一处翻译。然后重新生成补丁，相信您现在已经具
>> +备了灵活使用git am --amend的能力。
>> +
>> +每次迭代一个补丁，不要一次多个::
>> +
>> +       git am <您要修改的补丁>
>> +       直接对文件进行您的修改
>> +       git add .
>> +       git commit --amend
>> +
> Does `git am` complicate the revision process?

If you use git am, then you need to master the skill of manually

modifying patches. Judging from my past experience, this is

not an easy thing.


Thanks,

Yanteng


