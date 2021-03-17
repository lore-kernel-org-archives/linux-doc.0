Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A00FC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 02:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD93664F64
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 02:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhCQC3q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 22:29:46 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:42599 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229900AbhCQC3Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Mar 2021 22:29:24 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0USCjTgy_1615948162;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0USCjTgy_1615948162)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 17 Mar 2021 10:29:22 +0800
Subject: Re: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <3311b919-2f86-af05-97fc-ce1d4db277f9@linux.alibaba.com>
Date:   Wed, 17 Mar 2021 10:29:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LGTM.


在 2021/3/16 下午11:40, Wu XiangCheng 写道:
> Add translation zh_CN/admin-guide/bug-bisect.rst, and link it to
> zh_CN/admin-guide/index.rst while clean its todo entry.
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../zh_CN/admin-guide/bug-bisect.rst          | 81 +++++++++++++++++++
>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>  2 files changed, 82 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst b/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> new file mode 100644
> index 000000000000..662eb5b46e84
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> @@ -0,0 +1,81 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../admin-guide/bug-bisect`
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +二分（bisect）缺陷
> ++++++++++++++++++++
> +
> +（英文版）最后更新：2016年10月28日
> +
> +引言
> +=====
> +
> +始终尝试由来自kernel.org的源代码构建的最新内核。如果您没有信心这样做，请将
> +错误报告给您的发行版供应商，而不是内核开发人员。
> +
> +找到缺陷（bug）并不总是那么容易，不过仍然得去找。如果你找不到它，不要放弃。
> +尽可能多的向相关维护人员报告您发现的信息。请参阅MAINTAINERS文件以了解您所
> +关注的子系统的维护人员。
> +
> +在提交错误报告之前，请阅读“Documentation/admin-guide/reporting-issues.rst”。
> +
> +设备未出现（Devices not appearing）
> +====================================
> +
> +这通常是由udev/systemd引起的。在将其归咎于内核之前先检查一下。
> +
> +查找导致缺陷的补丁
> +===================
> +
> +使用 ``git`` 提供的工具可以很容易地找到缺陷，只要缺陷是可复现的。
> +
> +操作步骤：
> +
> +- 从git源代码构建内核
> +- 以此开始二分 [#f1]_::
> +
> +	$ git bisect start
> +
> +- 标记损坏的变更集::
> +
> +	$ git bisect bad [commit]
> +
> +- 标记正常工作的变更集::
> +
> +	$ git bisect good [commit]
> +
> +- 重新构建内核并测试
> +- 使用以下任一与git bisect进行交互::
> +
> +	$ git bisect good
> +
> +  或::
> +
> +	$ git bisect bad
> +
> +  这取决于您测试的变更集上是否有缺陷
> +- 在一些交互之后，git bisect将给出可能导致缺陷的变更集。
> +
> +- 例如，如果您知道当前版本有问题，而4.8版本是正常的，则可以执行以下操作::
> +
> +	$ git bisect start
> +	$ git bisect bad                 # Current version is bad
> +	$ git bisect good v4.8
> +
> +
> +.. [#f1] 您可以（可选地）在开始git bisect的时候提供good或bad参数
> +         ``git bisect start [BAD] [GOOD]``
> +
> +如需进一步参考，请阅读：
> +
> +- ``git-bisect`` 的手册页
> +- `Fighting regressions with git bisect（用git bisect解决回归）
> +  <https://www.kernel.org/pub/software/scm/git/docs/git-bisect-lk2009.html>`_
> +- `Fully automated bisecting with "git bisect run"（使用git bisect run
> +  来全自动二分） <https://lwn.net/Articles/317154>`_
> +- `Using Git bisect to figure out when brokenness was introduced
> +  （使用Git二分来找出何时引入了错误） <http://webchick.net/node/99>`_
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index fe2abc3fec86..7dc3540629f0 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -36,13 +36,13 @@ Todolist:
>     :maxdepth: 1
>  
>     reporting-issues
> +   bug-bisect
>  
>  Todolist:
>  
>     reporting-bugs
>     security-bugs
>     bug-hunting
> -   bug-bisect
>     tainted-kernels
>     ramoops
>     dynamic-debug-howto
> 
