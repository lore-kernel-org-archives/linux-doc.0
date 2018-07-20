Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 381EA7D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 02:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbeGTDN2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 23:13:28 -0400
Received: from mout.gmx.net ([212.227.15.18]:59239 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730255AbeGTDN1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Jul 2018 23:13:27 -0400
Received: from [10.10.23.31] ([52.175.35.13]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0MSdNs-1fYbvi1gBQ-00RVZU; Fri, 20
 Jul 2018 04:27:23 +0200
From:   Norman <norman.kern@gmx.com>
Subject: [PATCH] zh_CN:translation for block queue into Chinese
To:     linux-doc@vger.kernel.org
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-kernel@zh-kernel.org
Message-ID: <c10695de-d6aa-bb5a-2635-efd0f6f78269@gmx.com>
Date:   Fri, 20 Jul 2018 10:27:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Provags-ID: V03:K1:/eMVxzvN5qRNZbdE+rpyGlp7p8Q1j/vg+eTzQbk/4hnZWk0mKyV
 5P42JRQg06luPy2EaR7ONwTXGlAElGXl1ugzZEG2/nF4GqQpCBAu1EANKoowIrjUui8jaSn
 uLwGvvd9BSEwyS+u0HgGodiD2zNo9NKaY2kExDMhZdf9lwPVvjUZs2Ntsd95Via+3azEs0E
 zig6V5r8fjwvgfK7Ia8Pg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wyJ07eHufBk=:ZT83GEj8iGZREY6gQlad/y
 Qf1BT5ACZBPJBMgXxJLPMC3tyPFkhdH29p3iPxWXY6RA7SJqe91LBGsvdQ7zan/bdSIbJ6ixR
 fWMSYZUe+/OIhKWATJ8BXI9/iEn7/bGsGIx2yvZALUuIv3kWcZF6EdNpwnJuZb0XK4FspAWeo
 S0IEEFnzFo5vTIL1Av4azmKbmkwckdZHH/a+5mXd7XeG74N6lCwDrJHXbT9TPhvQEBu7yktF3
 VUZ5yb/7izzSOu606qXbtIePMum7weaxvLrcWRCzRXBhrg/IpzDBcjgp+iO0MJwxVdEvpUeJh
 szVlvOKaPHPB/JvZvY8nzBGYEOYTzXDr+rEaMurUaGJF3BWPosgqN/njNBs8tYexbhepNdc/m
 2a4kUup/VuPvmhysb3TnCZtUqVGhVpUpl6m3e92AVe7QI3KF88V8vKYlagSg+/PpoqFCP7kBi
 lpI6iZKaKAtfgGqTk2mZ4DeeVJ8D+gP8xeZ/4kmK9in5Co32T0BhKYyIOrlhFbdofgPst/q9R
 +asgrgl6udQVuhXxL1CqimpF5DjuRl3SuggWtpKsfpRmgSRVPMlIhakzXXFWRwZtcQ36jgo+O
 4ZFpF0VILE0O/EkN6CGM2CmVpyOA5mCUy4bHq1Qsc5Bt/vUpplLvPxK7D7eEt4fu4P3dFM5WZ
 Ey6TGJL11YstRj2Jfrn1o7Zhp93VEpo/gbszvzQIgRdWvsaN0tvOwVrkUUup+bX8n/sKdy7hH
 +Ed2gkrG3FVwsqwO2x/6kaJpDjFAhMu4kGVSks3Hh13V/Mhf5UrkYjXwkJ7rd43ittfFd9qjy
 7+MXN+n
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate block/queue-sysfs.txt into Chinese

Signed-off-by: Norman Kern <norman.kern@gmx.com>
---
  .../translations/zh_CN/block/queue-sysfs.md        | 205 
+++++++++++++++++++++
  1 file changed, 205 insertions(+)
  create mode 100644 Documentation/translations/zh_CN/block/queue-sysfs.md

diff --git a/Documentation/translations/zh_CN/block/queue-sysfs.md 
b/Documentation/translations/zh_CN/block/queue-sysfs.md
new file mode 100644
index 0000000..54bccba
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/queue-sysfs.md
@@ -0,0 +1,205 @@
+**Chinese translated version of Documentation/block/queue-sysfs.txt**
+
+If you have any comment or update to the content, please contact the
+original document maintainer directly.  However, if you have a problem
+communicating in English you can also ask the Chinese maintainer for
+help.  Contact the Chinese maintainer if this translation is outdated
+or if there is a problem with the translation.
+
+---------------------------------------------------------------------
+Documentation/block/queue-sysfs.txt 的中文翻译
+
+如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
+交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
+译存在问题，请联系中文版维护者。
+
+英文版维护者： Jens Axboe <jens.axboe@oracle.com\>
+中文版维护者： 项男 Norman Kern <norman.kern@gmx.com\>
+中文版翻译者： 项男 Norman Kern <norman.kern@gmx.com\>
+中文版校译者： 项男 Norman Kern <norman.kern@gmx.com\>
+
+以下为正文
+
+--------------------------------------------------------------------------------
+
+队列 sysfs 文件
+================================================================================
+这个文件将会详细描述位于每个块设备sysfs目录树下的队列文件。注意，堆叠设备典型地不会
+
+导出任何设置，因为它们的队列只起到重新映射目标的作用。这些文件可以在/sys/block/xxx/queue/目录下找到。
+
+使用RO后缀标记的文件是只读文件，RW后缀意为可读写文件。
+
+add_random (RW)
+--------------------------------------------------------------------------------
+这个文件允许关闭磁盘熵贡献。文件默认值是１（开启）。
+
+dax (RO)
+--------------------------------------------------------------------------------
+这个文件表明设备是否支持直接访问（DAX），CPU可寻址的存储使用它绕开页缓存。
+
+真时显示‘１’，否则显示‘０’。
+
+discard_granularity (RO)
+--------------------------------------------------------------------------------
+如果设备报告这项信息，它显示磁盘的内部分配大小（以字节为单位）。
+
+‘０’值表示设备不支持discard功能。
+
+discard_max_hw_bytes (RO)
+--------------------------------------------------------------------------------
+支持discard功能的设备可能包含在单个操作中能够削减或解映射的内部限制字节数。
+
+discard_max_bytes参数被设备驱动设置成在单次操作中能够被丢弃的最大字节数。
+
+发送给设备的discard请求数不允许超出这个限制。
+
+discard_max_bytes值为0意味着设备不支持discard功能。
+
+discard_max_bytes (RW)
+--------------------------------------------------------------------------------
+discard_max_hw_bytes是设备的硬件限制，而这个设置是软件限制。
+
+当大量discard请求被发出时，一些设备表现出高延迟；
+
+调低这一数值会使Linux发送较小的discard请求，这可能帮助降低大量discard操作引入的延迟。
+
+hw_sector_size (RO)
+--------------------------------------------------------------------------------
+这是设备的硬件扇区大小（以字节为单位）。
+
+io_poll (RW)
+--------------------------------------------------------------------------------
+读取该文件时，它的内容显示启用（１）或禁用（０）轮询。将‘０’写入该文件将禁用设备的轮询。
+
+写任何非０值都将启用该特性。
+
+io_poll_delay (RW)
+--------------------------------------------------------------------------------
+如果启用轮询，该参数控制执行哪种类型的轮询。默认值为-1，传统轮询。
+
+在这种模式下，CPU将会不放弃任何时间反复地询问完成情况。
+
+如果设置为０，将使用混合的轮询模式，内核将会尝试根据训练猜测何时IO完成。基于这一猜测，
+
+在进入一次传统轮询循环前，内核将发出IO请求的进程置成睡眠状态一段时间。
+
+这种模式可能比纯传统的轮询模式慢一些，但它可能更高效。
+
+如果这个值设置大于０，在进入传统轮询前，内核将设置发出IO请求的进程睡眠这么多的微秒。
+
+iostats (RW)
+--------------------------------------------------------------------------------
+这个文件用于控制（打开/关闭）磁盘的I/O状态统计。
+
+logical_block_size (RO)
+--------------------------------------------------------------------------------
+设备的逻辑块大小（以字节为单位）
+
+max_hw_sectors_kb (RO)
+--------------------------------------------------------------------------------
+这是单个数据传输的最大千字节数
+
+max_integrity_segments (RO)
+--------------------------------------------------------------------------------
+读取这个文件时，它的内容显示显示硬件控制器能够处理的完整段的最大限制，与块层设置一致。
+
+max_sectors_kb (RW)
+--------------------------------------------------------------------------------
+块层允许一个文件系统请求最大千字节数。它必须小于等于硬件允许的最大大小。
+
+max_segments (RO)
+--------------------------------------------------------------------------------
+设备的段数最大值。
+
+max_segment_size (RO)
+--------------------------------------------------------------------------------
+设备的最大段大小。
+
+minimum_io_size (RO)
+--------------------------------------------------------------------------------
+设备报告的最小首选IO大小。
+
+nomerges (RW)
+--------------------------------------------------------------------------------
+它允许用户禁用涉及块层IO合并请求的查找逻辑。默认（０）启用所有合并。
+
+当设置为１时，仅简单的one-hit合并会被尝试。当设置为２时，
+
+不会尝试任何合并算法（包括one-hit或更复杂的树/哈希查找）。
+
+nr_requests (RW)
+--------------------------------------------------------------------------------
+它控制在块层可以为读或写请求分配的请求数量。注意，累计分配的数量可能是当前值的双倍，
+
+因为它仅适用于读或写（而不是累加和）。
+
+为了通过请求饥饿避免优先级倒置，当启用CONFIG_BLK_CGROUP，
+
+一个请求队列为每个cgroup管理一个单独的请求池，并且这个参数适用于每一个per-block-cgroup请求池。
+
+换句话说，如果有N个块cgroups，每一个请求队列可能有多达N个请求池，每个请求池被nr_requests单独管理。
+
+optimal_io_size (RO)
+--------------------------------------------------------------------------------
+设备报告的最佳IO大小。
+
+physical_block_size (RO)
+--------------------------------------------------------------------------------
+设备物理块大小（以字节为单位）
+
+read_ahead_kb (RW)
+--------------------------------------------------------------------------------
+文件系统在该块设备上能够预读的最大千字节数。
+
+rotational (RW)
+--------------------------------------------------------------------------------
+这个文件用于申明设备是转动类型的或是非转动类型的。
+
+rq_affinity (RW)
+--------------------------------------------------------------------------------
+如果这个选项是‘１’，块层会将请求完成迁移到最初提交请求的CPU“组”。对于一些工作量，由于缓存效应，
+
+这能够大幅减少CPU周期。
+
+对于需要最大化完成处理分布（设置这个选项为‘２’）的存储配置，强制完成处理运行
+
+在发出请求的CPU上。（绕过“组”聚合逻辑）
+
+scheduler (RW)
+--------------------------------------------------------------------------------
+读取该文件时，它的内容显示设备当前使用和可用的IO调度器。当前激活的IO调度器会被放入中括号。
+
+向该文件写入IO调度器名称会切换该块设备的控制权到新的IO调度器。注意，
+
+如果IO调度器模块未加载到系统，写入其名称时会尝试加载它的模块。
+
+write_cache (RW)
+--------------------------------------------------------------------------------
+读取这个文件时，它的内容显示设备回写缓存启用与否。对于前者，它会返回“write 
back”，
+
+对于后者，它返回“write 
through”。写入这个文件能够改变设备的内核视图，但不能改变设备状态。
+
+这意味着勾选设置从“write back到“write 
through”可能不安全，因为那样也会忽略内核刷新的缓存。
+
+write_same_max_bytes (RO)
+--------------------------------------------------------------------------------
+设备在单个write-same命令里能够写入的最大字节数。0值意味着设备不支持write-same命令。
+
+wb_lat_usec (RW)
+--------------------------------------------------------------------------------
+如果设备注册了回写节流，那么这个文件显示目标最小读延迟。如果延迟时间超出了给定的时间窗（参见
+
+wb_window_usec），那么回写节流会开始缩放回写。将‘０’值写入该文件会禁用该特性。
+
+将‘-1’写入该文件会重置到默认设置。
+
+throttle_sample_time (RW)
+--------------------------------------------------------------------------------
+这是blk-throttle采样数据的时间窗口（以毫秒为单位）。blk-throttle基于采样进行决策。
+
+较低的时间意味着cgroups有更平稳的吞吐量，但是更高的CPU开销。该文件仅当启用
+
+CONFIG_BLK_DEV_THROTTLING_LOW时存在。
+
+Jens Axboe，2009年二月
-- 
2.10.1
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
