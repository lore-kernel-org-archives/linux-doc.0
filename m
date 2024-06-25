Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1EB286AE
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719285851; cv=none; b=TnQ6oLN7bdx/30vyrzUYfnb3MI3UPAG8LWdQPiFTISyPLvsBqaQs2rsBL/y7yvC2cPNuVUi0z02Wi5/0TPaqRjQegF78ZhebBDIFviXJ7YNKExYhBYK+Q5R2mCy0bk7kXYYH3P5ppugdSyNwSiij/y1FjzKDHVdvHGVPgk8vSbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719285851; c=relaxed/simple;
	bh=JneR3Y6rX+f6p58J9mTrC1T3MYqZNbDwUgJPJwtU6n0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PNHu6x3A5TlTrPP5bWwRwaPDvO+vu+eApInTWQXTUH65fQ8kM/+P24CCG/UuYgyd1GivwBnkYq7UPZ26gow+76TlYX7yD1xYsXM4ZpF4ZhLUEw+jhkXtnWqkIY+3aKlJerwM6ifphZGig9QAdAkR2vBmu+JEqUsGA2oHbqaiqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.110.225])
	by gateway (Coremail) with SMTP id _____8AxW+pVOHpm_LwJAA--.39661S3;
	Tue, 25 Jun 2024 11:24:05 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.225])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVcVUOHpmyQEwAA--.37811S2;
	Tue, 25 Jun 2024 11:24:05 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs/zh_CN: Add driver-api phy translation
Date: Tue, 25 Jun 2024 11:23:52 +0800
Message-Id: <20240625032352.3290797-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxVcVUOHpmyQEwAA--.37811S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3KFWkJry5Xw18ur43Gr45Arc_yoWkWFWkpF
	4DWFyftw4IqFy7uw4qyF1UWFyjk3Wxur48KF1xua4avrn8Xrs0va1Utryag3Z3W34kCFy8
	tF45JFyfAry7CrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Translate driver-api/phy.rst into Chinese.

commit d02aa181ee59 ("phy: Add devm_of_phy_optional_get() helper")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
v2:
Modified some sentences in accordance with Dongliang's comments.

 .../translations/zh_CN/driver-api/index.rst   |   2 +-
 .../zh_CN/driver-api/phy/index.rst            |  20 ++
 .../translations/zh_CN/driver-api/phy/phy.rst | 213 ++++++++++++++++++
 3 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/driver-api/phy/index.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/phy/phy.rst

diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 92ff1b7fc3d3..4050a2fb51c6 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -23,6 +23,7 @@ Linux驱动实现者的API指南
 
    gpio/index
    io_ordering
+   phy/index
 
 Todolist:
 
@@ -103,7 +104,6 @@ Todolist:
 *   parport-lowlevel
 *   pps
 *   ptp
-*   phy/index
 *   pwm
 *   pldmfw/index
 *   rfkill
diff --git a/Documentation/translations/zh_CN/driver-api/phy/index.rst b/Documentation/translations/zh_CN/driver-api/phy/index.rst
new file mode 100644
index 000000000000..2cdce17b74a9
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/phy/index.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+PHY 通用框架
+============
+
+.. toctree::
+
+   phy
+
+Todolist:
+
+*   samsung-usb2
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/driver-api/phy/phy.rst b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
new file mode 100644
index 000000000000..0d8feae2b8a9
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
@@ -0,0 +1,213 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/phy/phy.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+=========
+PHY子系统
+=========
+
+:作者: Kishon Vijay Abraham I <kishon@ti.com>
+
+本文档解释了 PHY 的通用框架和提供的API，以及使用方法。
+
+简介
+====
+
+*PHY* 是物理层的缩写，它被用来把设备连接到一个物理媒介，例如USB控制器
+有一个提供序列化、反序列化、编码、解码和负责获取所需的数据传输速率的 PHY。
+注意，有些USB控制器内嵌了 PHY 的功能，其它的则使用了一个外置的PHY，此外
+使用 PHY 的设备还有无线网、以太网、SATA等（控制器）。
+
+创建这个框架的目的是将遍布 Linux 内核的 PHY 驱动程序融入到 drivers/phy，
+以增加代码的可复用性，进而提高代码的可维护性。
+
+该框架仅适用于使用外部 PHY（PHY 功能未嵌入控制器内）的设备。
+
+注册/注销PHY provider
+=====================
+
+PHY provider是指实现一个或多个 PHY 实例的实体。对于 PHY provider 仅
+实现单个 PHY 实例的简单情况，框架在 of_phy_simple_xlate 中提供其自己
+的 of_xlate 实现。如果 PHY provider 实现多个实例，则应提供其自己的
+of_xlate 实现。of_xlate 仅用于 dt 启动情况。
+
+::
+
+	#define of_phy_provider_register(dev, xlate)    \
+		__of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
+
+	#define devm_of_phy_provider_register(dev, xlate)       \
+		__devm_of_phy_provider_register((dev), NULL, THIS_MODULE,
+						(xlate))
+
+of_phy_provider_register 和 devm_of_phy_provider_register 宏
+可用于注册 phy_provider，它以 device 和 of_xlate 作为参数。对于 dt
+启动情况，所有 PHY provider 都应使用上述两个宏之一来注册 PHY provider。
+
+与 PHY provider 关联的设备树节点通常包含一组子节点，每个子节点代表一个
+PHY。某些绑定可能会为了上下文和可扩展性将子节点嵌套在特别的层级中，在这种
+情况下，可以使用低级别的 of_phy_provider_register_full() 和
+devm_of_phy_provider_register_full() 宏来覆盖包含子节点的节点。
+
+::
+
+	#define of_phy_provider_register_full(dev, children, xlate) \
+		__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
+
+	#define devm_of_phy_provider_register_full(dev, children, xlate) \
+		__devm_of_phy_provider_register_full(dev, children,
+						     THIS_MODULE, xlate)
+
+	void devm_of_phy_provider_unregister(struct device *dev,
+		struct phy_provider *phy_provider);
+	void of_phy_provider_unregister(struct phy_provider *phy_provider);
+
+devm_of_phy_provider_unregister 和 of_phy_provider_unregister
+可以被用来注销PHY.
+
+创建PHY
+=======
+
+PHY 驱动程序应创建 PHY，以便其他外围（芯片）控制器能够使用它。PHY 框架
+提供了 2 个 API 来创建 PHY。
+
+::
+
+	struct phy *phy_create(struct device *dev, struct device_node *node,
+			       const struct phy_ops *ops);
+	struct phy *devm_phy_create(struct device *dev,
+				    struct device_node *node,
+				    const struct phy_ops *ops);
+
+PHY 驱动程序可以使用上述两个 API 之一，通过传递设备指针和 phy_ops
+来创建 PHY。
+
+phy_ops 是一组用于执行 PHY 操作（例如 init、exit、power_on 和
+power_off）的函数指针。
+
+为了取消引用私有数据（在 phy_ops 中），PHY provider驱动程序可以在创建
+PHY 后使用 phy_set_drvdata()，并在 phy_ops 中使用 phy_get_drvdata()
+来取回私有数据。
+
+获取对 PHY 的引用
+=================
+
+控制器必须先获取对 PHY 的引用，然后才能使用 PHY。此框架提供以下 API
+来获取对 PHY 的引用。
+
+::
+
+	struct phy *phy_get(struct device *dev, const char *string);
+	struct phy *devm_phy_get(struct device *dev, const char *string);
+	struct phy *devm_phy_optional_get(struct device *dev,
+					  const char *string);
+	struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
+				    const char *con_id);
+	struct phy *devm_of_phy_optional_get(struct device *dev,
+					     struct device_node *np,
+					     const char *con_id);
+	struct phy *devm_of_phy_get_by_index(struct device *dev,
+					     struct device_node *np,
+					     int index);
+
+phy_get、devm_phy_get 和 devm_phy_optional_get 可用于在 dt
+启动的情况下获取 PHY，字符串参数应包含 dt 数据中给出的 phy 名称，在
+非 dt 启动的情况下，它应包含 PHY 的标签。两个 devm_phy_get 在成功
+获取 PHY 后使用 devres 将设备与 PHY 关联。在驱动程序分离时，将在
+devres 数据上调用 release 函数并释放 devres 数据。当 phy 是可选
+的时，应使用 _optional_get 变体。这些函数永远不会返回 -ENODEV，而
+是在找不到 phy 时返回 NULL。一些通用驱动程序（例如 ehci）可能使用
+多个 phy。在这种情况下，devm_of_phy_get 或 devm_of_phy_get_by_index
+用于根据名称或索引获取 phy 引用。
+
+需要注意的是，NULL 是有效的 phy 引用。NULL phy 上的所有 phy 使用
+者调用都将成为 NOP。也就是说释放调用，当应用于 NULL phy 时，release
+调用、phy_init()/phy_exit() 调用、phy_power_on()/phy_power_off()
+调用都是 NOP。NULL phy 在处理可选的 phy 设备中很有用。
+
+API的调用顺序
+=============
+
+通常，调用顺序应该是::
+
+    [devm_][of_]phy_get()
+    phy_init()
+    phy_power_on()
+    [phy_set_mode[_ext]()]
+    ...
+    phy_power_off()
+    phy_exit()
+    [[of_]phy_put()]
+
+一些PHY驱动可能没有实现 :c:func:`phy_init` 或 :c:func:`phy_power_on`,
+但是控制器应该总是调用这些函数以兼容其它PHY，有些PHY可能要求
+:c:func:`phy_set_mode <phy_set_mode_ext>` 而其他 PHY 可能使用
+默认模式（通常通过设备树或其他固件配置）。出于兼容性考虑，如果您知道将
+使用哪种模式，则应始终调用此函数。通常，应在 :c:func:`phy_power_on`
+之后调用此函数，尽管某些 PHY 驱动程序可能随时允许调用它。
+
+释放对 PHY 的引用
+=================
+
+当控制器不再需要 PHY 时，它必须使用上一节中提到的 API 释放对已获得
+的 PHY 的引用。PHY 框架提供了 2 个 API 来释放对 PHY 的引用。
+
+::
+
+	void phy_put(struct phy *phy);
+	void devm_phy_put(struct device *dev, struct phy *phy);
+
+这两个 API 都用于释放对 PHY 的引用，并且 devm_phy_put 会销毁与此
+PHY 关联的设备资源。
+
+销毁 PHY
+========
+
+卸载创建 PHY 的驱动程序时，它应该使用以下 2 个 API 之一销毁其创建的
+PHY::
+
+	void phy_destroy(struct phy *phy);
+	void devm_phy_destroy(struct device *dev, struct phy *phy);
+
+这两个 API 都会销毁 PHY，并且 devm_phy_destroy 会销毁与此 PHY 关
+联的 devres。
+
+PM Runtime
+==========
+
+这个子系统启用了pm runtime。 所以，在创建PHY 时，将调用此子系统创建的
+phy 设备的 pm_runtime_enable 函数，在销毁 PHY 时，将调用
+pm_runtime_disable。请注意，此子系统创建的 phy 设备将是调用 phy_create
+（PHY provider 设备）的设备的子设备。
+
+因此，由于父子关系，此子系统创建的 phy_device 的 pm_runtime_get_sync
+调用 PHY provider 设备的 pm_runtime_get_sync。还应注意，
+phy_power_on 和 phy_power_off 分别执行 phy_pm_runtime_get_sync 和
+phy_pm_runtime_put。有导出的 API，如 phy_pm_runtime_get、
+phy_pm_runtime_get_sync、phy_pm_runtime_put、phy_pm_runtime_put_sync、
+phy_pm_runtime_allow 和 phy_pm_runtime_forbid，用于执行 PM 操作。
+
+PHY映射
+=======
+
+为了在没有 DeviceTree 帮助的情况下获取对 PHY 的引用，框架提供了可与
+clkdev 进行比较的查找，允许将 clk 结构体绑定到设备。当 struct phy 的
+句柄已存在时，可以在运行时进行查找。
+
+该框架提供以下 API 用于注册和注销查找::
+
+	int phy_create_lookup(struct phy *phy, const char *con_id,
+			      const char *dev_id);
+	void phy_remove_lookup(struct phy *phy, const char *con_id,
+			       const char *dev_id);
+
+DeviceTree绑定
+==============
+
+PHY dt 绑定的文档可以在以下位置找到 @
+Documentation/devicetree/bindings/phy/phy-bindings.txt
-- 
2.31.4

