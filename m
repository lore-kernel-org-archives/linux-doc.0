Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C06EC433DB
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 09:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A04DD64E04
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 09:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbhCAJOm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 04:14:42 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:33176 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233009AbhCAJOk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 04:14:40 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPwsuYw_1614590031;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPwsuYw_1614590031)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 01 Mar 2021 17:13:52 +0800
Subject: Re: [PATCH v2 4/9] docs/zh_CN: Improve
 zh_CN/process/3.Early-stage.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1614488009.git.bobwxc@email.cn>
 <0e893a3171884f832366cf248e131e9a2972762f.1614488009.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <f11fd22b-705b-3258-9551-e202b6c3b03b@linux.alibaba.com>
Date:   Mon, 1 Mar 2021 17:13:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0e893a3171884f832366cf248e131e9a2972762f.1614488009.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/2/28 下午1:38, Wu XiangCheng 写道:
> Improve language and grammar of zh_CN/process/3.Early-stage.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../zh_CN/process/3.Early-stage.rst           | 131 +++++++++---------
>  1 file changed, 69 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/3.Early-stage.rst b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> index b8676aec6005..79e951b574fb 100644
> --- a/Documentation/translations/zh_CN/process/3.Early-stage.rst
> +++ b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> @@ -1,7 +1,14 @@
>  .. include:: ../disclaimer-zh_CN.rst
>  
>  :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> +
> +:Translator:
> +
> + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> +
> +:校译:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
>  
>  .. _cn_development_early_stage:
>  
> @@ -9,45 +16,45 @@
>  ========
>  
>  当考虑一个Linux内核开发项目时，很可能会直接跳进去开始编码。然而，与任何重要
> -的项目一样，成功的许多基础最好是在第一行代码编写之前就做好了。在早期计划和
> -沟通中花费一些时间可以节省更多的时间。
> +的项目一样，许多成功的基础最好是在第一行代码编写之前就打下。在早期计划和
> +沟通中花费一些时间可以在之后节省更多的时间。
>  
> -详述问题
> +搞清问题
>  --------

better to keep old one?

>  
> -与任何工程项目一样，成功的内核增强从要解决的问题的清晰描述开始。在某些情况
> -下，这个步骤很容易：例如，当某个特定硬件需要驱动程序时。不过，在其他方面，
> -将实际问题与建议的解决方案混淆是很有诱惑力的，这可能会导致困难。
> +与任何工程项目一样，成功的内核改善从清晰描述要解决的问题开始。在某些情况
> +下，这个步骤很容易：例如当某个特定硬件需要驱动程序时。不过，在其他情况下，
> +很容易将实际问题与建议的解决方案混在一起，这可能会导致麻烦。

better on Chinese custom.

>  
> -举个例子：几年前，使用Linux音频的开发人员寻求一种方法来运行应用程序，而不因
> -系统延迟过大而导致退出或其他工件。他们得到的解决方案是一个内核模块，旨在连
> -接到Linux安全模块（LSM）框架中；这个模块可以配置为允许特定的应用程序访问
> -实时调度程序。这个模块被实现并发送到Linux内核邮件列表，在那里它立即遇到问题。
> +举个例子：几年前，Linux音频的开发人员寻求一种方法来运行应用程序，而不会因
> +系统延迟过大而导致退出或其他问题。他们得到的解决方案是一个连接到Linux安全
> +模块（LSM）框架中的内核模块；这个模块可以配置为允许特定的应用程序访问实时
> +调度程序。这个模块被实现并发到linux-kernel邮件列表，在那里它立即遇到了麻烦。
>  
>  对于音频开发人员来说，这个安全模块足以解决他们当前的问题。但是，对于更广泛的
>  内核社区来说，这被视为对LSM框架的滥用（LSM框架并不打算授予他们原本不具备的
>  进程特权），并对系统稳定性造成风险。他们首选的解决方案包括短期的通过rlimit
>  机制进行实时调度访问，以及长期的减少延迟的工作。
>  
> -然而，音频社区看不到他们实施的特定解决方案的过去；他们不愿意接受替代方案。
> +然而，音频社区无法超越他们实施的特定解决方案来看问题；他们不愿意接受替代方案。

the old doc has point on the 'history', but new doc miss this point.

>  由此产生的分歧使这些开发人员对整个内核开发过程感到失望；其中一个开发人员返回
> -到音频列表并发布了以下内容：
> +到audio列表并发布了以下内容：
>  
> -        有很多非常好的Linux内核开发人员，但他们往往会被一群傲慢的傻瓜所压倒。
> -        试图向这些人传达用户需求是浪费时间。他们太“聪明”了，根本听不到少数人
> -        的话。
> +	这里有很多非常好的Linux内核开发人员，但他们往往会被一群傲慢的傻瓜所
> +	压倒。试图向这些人传达用户需求是浪费时间。他们太“聪明”了，根本听不
> +	到少数人的话。

Has the indent problem? and seems no need to add a word ‘这里‘。

>  
>  （http://lwn.net/articles/131776/）
>  
> -实际情况不同；与特定模块相比，内核开发人员更关心系统稳定性、长期维护以及找到
> -正确的问题解决方案。这个故事的寓意是把重点放在问题上——而不是具体的解决方案
> -上——并在投入创建代码之前与开发社区讨论这个问题。
> +实际情况却是不同的；与特定模块相比，内核开发人员更关心系统稳定性、长期维护
> +以及找到问题的正确解决方案。这个故事的寓意是把重点放在问题上——而不是具体的
> +解决方案上——并在开始编写代码之前与开发社区讨论这个问题。
>  
>  因此，在考虑一个内核开发项目时，我们应该得到一组简短问题的答案：
>  
> - - 究竟需要解决的问题是什么？
> + - 需要解决的问题究竟是什么？

haha, actually no different.

>  
> - - 受此问题影响的用户是谁？解决方案应该解决哪些用例？
> + - 受此问题影响的用户有哪些？解决方案应该解决哪些使用案例？
>  
>   - 内核现在为何没能解决这个问题？

why remove this line?

>  
> @@ -62,11 +69,11 @@
>  
>   - 很可能问题是由内核以您不理解的方式解决的。Linux内核很大，具有许多不明显
>     的特性和功能。并不是所有的内核功能都像人们所希望的那样有文档记录，而且很
> -   容易遗漏一些东西。你的作者发出了一个完整的驱动程序，复制了一个新作者不
> -   知道的现有驱动程序。重新设计现有轮子的代码不仅浪费，而且不会被接受到主线
> +   容易遗漏一些东西。某作者发布了一个完整的驱动程序，重复了一个其不
> +   知道的现有驱动程序。重新发明现有轮子的代码不仅浪费，而且不会被接受到主线
>     内核中。
>  
> - - 建议的解决方案中可能有一些元素不适用于主线合并。在编写代码之前，最好先
> + - 建议的解决方案中可能有一些要素不适合并入主线。在编写代码之前，最好先
>     了解这样的问题。
>  
>   - 其他开发人员完全有可能考虑过这个问题；他们可能有更好的解决方案的想法，并且

why remove this line?

> @@ -74,88 +81,88 @@
>  
>  在内核开发社区的多年经验给了我们一个明确的教训：闭门设计和开发的内核代码总是
>  有一些问题，这些问题只有在代码发布到社区中时才会被发现。有时这些问题很严重，
> -需要数月或数年的努力才能使代码达到内核社区的标准。一些例子包括：
> +需要数月或数年的努力才能使代码达到内核社区的标准。例如：
>  
>   - 设计并实现了单处理器系统的DeviceScape网络栈。只有使其适合于多处理器系统，
> -   才能将其合并到主线中。在代码中改装锁等等是一项困难的任务；因此，这段代码
> +   才能将其合并到主线中。在代码中修改锁等等是一项困难的任务；因此，这段代码
>     （现在称为mac80211）的合并被推迟了一年多。
>  
>   - Reiser4文件系统包含许多功能，核心内核开发人员认为这些功能应该在虚拟文件

why remove this line?

>     系统层中实现。它还包括一些特性，这些特性在不将系统暴露于用户引起的死锁的
> -   情况下是不容易实现的。这些问题的最新发现——以及对其中一些问题的拒绝——已经
> -   导致Reiser4远离了主线内核。
> +   情况下是不容易实现的。这些问题过迟发现——以及拒绝处理其中一些问题——已经
> +   导致Reiser4置身主线内核之外。
>  
>   - Apparmor安全模块以被认为不安全和不可靠的方式使用内部虚拟文件系统数据结构。
> -   这种担心（包括其他）使Apparmor多年不在主线上。
> +   这种担心（包括其他）使Apparmor多年来无法进入主线。
>  
> -在每一种情况下，通过与内核开发人员的早期讨论，可以避免大量的痛苦和额外的工作。
> +在这些情况下，与内核开发人员的早期讨论，可以避免大量的痛苦和额外的工作。
>  
> -找谁交流
> ---------
> +找谁交流？
> +----------

why a new "?"

Hmm, seem there are much of thing isn't in your explanated email.
Would you like to just patch what's we talked? since some of trival
changes don't has much meaning on understanding or others.

Thanks!

>  
>  当开发人员决定公开他们的计划时，下一个问题是：我们从哪里开始？答案是找到正确
>  的邮件列表和正确的维护者。对于邮件列表，最好的方法是在维护者(MAINTAINERS)文件
> -中查找要发布的相关位置。如果有一个合适的子系统列表，那么发布它通常比在Linux
> -内核上发布更可取；您更有可能接触到在相关子系统中具有专业知识的开发人员，并且
> -环境可能具支持性。
> +中查找要发布的相关位置。如果有一个合适的子系统列表，那么其上发布通常比在
> +linux-kernel上发布更可取；您更有可能接触到在相关子系统中具有专业知识的开发
> +人员，并且环境可能具支持性。
>  
> -找到维护人员可能会有点困难。同样，维护者文件是开始的地方。但是，该文件往往不总
> -是最新的，并且并非所有子系统都在那里表示。实际上，维护者文件中列出的人员可能
> +找到维护人员可能会有点困难。同样，维护者文件是开始的地方。但是，该文件往往不
> +是最新的，并且并非所有子系统都在那里显示。实际上，维护者文件中列出的人员可能
>  不是当前实际担任该角色的人员。因此，当对联系谁有疑问时，一个有用的技巧是使用
> -git（尤其是“git-log”）查看感兴趣的子系统中当前活动的用户。看看谁在写补丁，
> -如果有人的话，谁会在这些补丁上加上用线签名的。这些人将是帮助新开发项目的最佳
> -人选。
> +git（尤其是“git-log”）查看感兴趣的子系统中当前活动的用户。看看谁在写补丁、
> +谁会在这些补丁上加上Signed-off-by行签名（如有）。这些人将是帮助新开发项目的
> +最佳人选。
>  
> -找到合适的维护者的任务有时是非常具有挑战性的，以至于内核开发人员添加了一个
> -脚本来简化过程：
> +找到合适的维护者有时是非常具有挑战性的，以至于内核开发人员添加了一个
> +脚本来简化这个过程：
>  
>  ::
>  
>  	.../scripts/get_maintainer.pl
>  
> -当给定“-f”选项时，此脚本将返回给定文件或目录的当前维护者。如果在命令行上传递
> +当给定“-f”选项时，此脚本将返回指定文件或目录的当前维护者。如果在命令行上给出


>  了一个补丁，它将列出可能接收补丁副本的维护人员。有许多选项可以调节
> -get_maintainer.pl搜索维护者的难易程度；请小心使用更具攻击性的选项，因为最终
> +get_maintainer.pl搜索维护者的严格程度；请小心使用更激进的选项，因为最终结果
>  可能会包括对您正在修改的代码没有真正兴趣的开发人员。
>  
> -如果所有其他方法都失败了，那么与Andrew Morton交谈可以成为一种有效的方法来跟踪
> -特定代码段的维护人员。
> +如果所有其他方法都失败了，那么与Andrew Morton交流是跟踪特定代码段维护人员
> +的一种有效方法。
>  
>  何时邮寄？
>  ----------
>  
> -如果可能的话，在早期阶段发布你的计划只会有帮助。描述正在解决的问题以及已经
> +如果可能的话，在早期阶段发布你的计划只会更有帮助。描述正在解决的问题以及已经
>  制定的关于如何实施的任何计划。您可以提供的任何信息都可以帮助开发社区为项目
>  提供有用的输入。
>  
> -在这个阶段可能发生的一件令人沮丧的事情不是敌对的反应，而是很少或根本没有
> -反应。可悲的事实是：（1）内核开发人员往往很忙；（2）不缺少有宏伟计划和很少
> -代码（甚至代码前景）支持他们的人；（3）没有人有义务审查或评论别人发表的
> -想法。除此之外，高级设计常常隐藏一些问题，这些问题只有在有人真正尝试实现
> -这些设计时才会被发现；因此，内核开发人员宁愿看到代码。
> +在这个阶段可能发生的一件令人沮丧的事情不是得到反对意见，而是很少或根本没有
> +反馈。令人伤心的事实是：（1）内核开发人员往往很忙；（2）不缺少有宏伟计划但
> +代码（甚至代码设想）很少的人去支持他们；（3）没有人有义务审查或评论别人发表
> +的想法。除此之外，高层级的设计常常隐藏着一些问题，这些问题只有在有人真正尝试
> +实现这些设计时才会被发现；因此，内核开发人员宁愿看到代码。
>  
> -如果发表评论的请求在评论的方式上没有什么效果，不要假设这意味着对项目没有
> -兴趣。不幸的是，你也不能假设你的想法没有问题。在这种情况下，最好的做法是
> +如果发布请求评论（RFC）并没得到什么有用的评论，不要以为这意味着无人对此项目
> +有兴趣，同时你也不能假设你的想法没有问题。在这种情况下，最好的做法是
>  继续进行，把你的进展随时通知社区。
>  
>  获得官方认可
>  -----------------------
>  
> -如果您的工作是在公司环境中完成的，就像大多数Linux内核工作一样，显然，在您将
> -公司的计划或代码发布到公共邮件列表之前，必须获得适当授权的经理的许可。发布
> -不确定是否兼容GPL的代码可能是有特别问题的；公司的管理层和法律人员越早能够就
> +如果您的工作是在公司环境中完成的，就像大多数Linux内核工作一样；显然，在您将
> +公司的计划或代码发布到公共邮件列表之前，必须获得有适当权利经理的许可。发布
> +不确定是否兼容GPL的代码尤其会带来问题；公司的管理层和法律人员越早能够就
>  发布内核开发项目达成一致，对参与的每个人都越好。
>  
>  一些读者可能会认为他们的核心工作是为了支持还没有正式承认存在的产品。将雇主
>  的计划公布在公共邮件列表上可能不是一个可行的选择。在这种情况下，有必要考虑
>  保密是否真的是必要的；通常不需要把开发计划关在门内。
>  
> -也就是说，有些情况下，一家公司在开发过程的早期就不能合法地披露其计划。拥有
> -经验丰富的内核开发人员的公司可以选择以开环的方式进行，前提是他们以后能够避免
> +的确，有些情况下一家公司在开发过程的早期无法合法地披露其计划。拥有经验
> +丰富的内核开发人员的公司可能选择以开环的方式进行开发，前提是他们以后能够避免
>  严重的集成问题。对于没有这种内部专业知识的公司，最好的选择往往是聘请外部
> -开发商根据保密协议审查计划。Linux基金会运行了一个NDA程序，旨在帮助解决这种
> -情况；
> +开发者根据保密协议审查计划。Linux基金会运行了一个NDA程序，旨在帮助解决这种
> +情况；更多信息参见：
>  
> -    http://www.linuxfoundation.org/en/NDA_program
> +    http://www.linuxfoundation.org/nda/
>  
>  这种审查通常足以避免以后出现严重问题，而无需公开披露项目。
> 
